return {
  "nickjvandyke/opencode.nvim",
  version = "*", -- Latest stable release
  dependencies = {
    {
      -- `snacks.nvim` integration is recommended, but optional
      ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
      "folke/snacks.nvim",
      optional = true,
      opts = {
        input = {}, -- Enhances `ask()`
        picker = { -- Enhances `select()`
          actions = {
            opencode_send = function(...)
              return require("opencode").snacks_picker_send(...)
            end,
          },
          win = {
            input = {
              keys = {
                ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
  },
  config = function()
    local opencode_buf = nil -- Persistent terminal buffer

    ---@type opencode.Opts
    vim.g.opencode_opts = {
      lsp = { enabled = true },
      server = {
        toggle = function()
          -- Reuse existing buffer if still valid
          if opencode_buf and vim.api.nvim_buf_is_valid(opencode_buf) then
            for _, w in ipairs(vim.api.nvim_list_wins()) do
              if vim.api.nvim_win_get_buf(w) == opencode_buf then
                vim.api.nvim_win_close(w, true)
                return
              end
            end
            -- Buffer exists but not shown; reopen it
            local width = math.floor(vim.o.columns * 0.40)
            local height = math.floor(vim.o.lines * 0.84)
            local row = math.floor(vim.o.lines * 0.08)
            local col = math.floor(vim.o.columns * 0.58)
            local win = vim.api.nvim_open_win(opencode_buf, true, {
              relative = "editor",
              width = width,
              height = height,
              row = row,
              col = col,
              style = "minimal",
              border = "single",
            })
            vim.api.nvim_set_current_win(win)
            vim.cmd("startinsert")
            return
          end
          -- Create new terminal
          local width = math.floor(vim.o.columns * 0.40)
          local height = math.floor(vim.o.lines * 0.84)
          local row = math.floor(vim.o.lines * 0.08)
          local col = math.floor(vim.o.columns * 0.58)
          opencode_buf = vim.api.nvim_create_buf(false, true)
          local win = vim.api.nvim_open_win(opencode_buf, true, {
            relative = "editor",
            width = width,
            height = height,
            row = row,
            col = col,
            style = "minimal",
            border = "single",
          })
          vim.fn.termopen("opencode --port", {
            on_exit = function()
              vim.schedule(function()
                opencode_buf = nil
                if vim.api.nvim_win_is_valid(win) then
                  vim.api.nvim_win_close(win, true)
                end
              end)
            end,
          })
          vim.cmd("startinsert")
        end,
      },
    }

    -- Kill opencode terminal when nvim exits to prevent orphaned processes
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        if opencode_buf and vim.api.nvim_buf_is_valid(opencode_buf) then
          local chan = vim.bo[opencode_buf].channel
          if chan and chan > 0 then
            vim.fn.jobstop(chan)
          end
        end
      end,
    })

    vim.o.autoread = true -- Required for `opts.events.reload`

    -- Recommended/example keymaps
    vim.keymap.set({ "n", "x" }, "<C-a>", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "Ask opencode…" })
    vim.keymap.set({ "n", "x" }, "<C-x>", function()
      require("opencode").select()
    end, { desc = "Select opencode…" })

    vim.keymap.set({ "n", "x" }, "go", function()
      return require("opencode").operator("@this ")
    end, { desc = "Add range to opencode", expr = true })
    vim.keymap.set("n", "goo", function()
      return require("opencode").operator("@this ") .. "_"
    end, { desc = "Add line to opencode", expr = true })

    vim.keymap.set("n", "<S-C-u>", function()
      require("opencode").command("session.half.page.up")
    end, { desc = "Scroll opencode up" })
    vim.keymap.set("n", "<S-C-d>", function()
      require("opencode").command("session.half.page.down")
    end, { desc = "Scroll opencode down" })

    -- Exit terminal mode with <C-g>
    vim.keymap.set("t", "<C-g>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

    -- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above
    vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
    vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
  end,
}
