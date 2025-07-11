return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    filter = function(mapping)
      return mapping.desc and mapping.desc ~= ""
    end,
    triggers = {
      { "<leader>", mode = "n" },
    },
    plugins = {
      marks = false, -- shows a list of your marks on ' and `
      registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in neovim
      -- No actual key bindings are created
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = false, -- adds help for operators like d, y, ...
        motions = false, -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = false, -- default bindings on <c-w>
        nav = false, -- misc bindings to work with windows
        z = false, -- bindings for folds, spelling and others prefixed with z
        g = false, -- bindings for prefixed with g
      },
    },
  },
  config = function(_, opts)
    require("which-key").setup(opts)
    -- raw keymaps
    local keymaps = require("core.keymap").keymaps

    -- set lspsaga keymaps
    local sagakeys = {
      {
        "<leader>l",
        group = "lspsaga",
        icon = "🍅",
      },
      {
        "<leader>lr",
        ":Lspsaga rename<CR>",
        silent = true,
        desc = "rename variables",
        icon = "🍑",
      },
      {
        "<leader>ld",
        ":Lspsaga goto_definition<CR>",
        silent = true,
        desc = "goto definition",
        icon = "🍑",
      },
      {
        "<leader>lc",
        ":Lspsaga code_action<CR>",
        silent = true,
        desc = "code acton invoke",
        icon = "🍑",
      },
      {
        "<leader>lh",
        ":Lspsaga hover_doc<CR>",
        silent = true,
        desc = "hover help doc",
        icon = "🍑",
      },
      {
        "<leader>lF",
        ":Lspsaga finder<CR>",
        silent = true,
        desc = "show find win",
        icon = "🍑",
      },
      {
        "<leader>ln",
        ":Lspsaga diagnostic_jump_next<CR>",
        silent = true,
        desc = "jump to next diagnostic",
        icon = "🍑",
      },
      {
        "<leader>lp",
        ":Lspsaga diagnostic_jump_prev<CR>",
        silent = true,
        desc = "jump to previous diagnostic",
        icon = "🍑",
      },
    }

    local wk = require("which-key")
    wk.add(keymaps)
    wk.add(sagakeys)
  end,
}
