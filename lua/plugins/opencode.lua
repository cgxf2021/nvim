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
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      lsp = { enabled = true },
      server = {
        toggle = function()
          -- Close existing floating terminal if open
          for _, w in ipairs(vim.api.nvim_list_wins()) do
            local cfg = vim.api.nvim_win_get_config(w)
            if cfg.relative == "editor" then
              local buf = vim.api.nvim_win_get_buf(w)
              if vim.bo[buf].buftype == "terminal" then
                vim.api.nvim_win_close(w, true)
                return
              end
            end
          end
          -- Open new floating terminal
          local width = math.floor(vim.o.columns * 0.8)
          local height = math.floor(vim.o.lines * 0.8)
          local row = math.floor(vim.o.lines * 0.1)
          local col = math.floor(vim.o.columns * 0.1)
          local buf = vim.api.nvim_create_buf(false, true)
          local win = vim.api.nvim_open_win(buf, true, {
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

    -- Exit terminal mode with <Esc>
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

    -- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above
    vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
    vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
  end,
}
