return {
  "xiyaowong/transparent.nvim",
  opts = {
    -- table: default groups
    groups = {
      "Normal",
      "NormalNC",
      "Comment",
      "Constant",
      "Special",
      "Identifier",
      "Statement",
      "PreProc",
      "Type",
      "Underlined",
      "Todo",
      "String",
      "Function",
      "Conditional",
      "Repeat",
      "Operator",
      "Structure",
      "LineNr",
      "NonText",
      "SignColumn",
      "CursorLine",
      "CursorLineNr",
      "StatusLine",
      "StatusLineNC",
      "EndOfBuffer",
    },
    -- table: additional groups that should be cleared
    extra_groups = {
      "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
      "NvimTreeNormal", -- NvimTree
    },
    -- table: groups you don't want to clear
    exclude_groups = {},
    -- function: code to be executed after highlight groups are cleared
    -- Also the user event "TransparentClear" will be triggered
    on_clear = function() end,
  },

  config = function(_, opts)
    require("transparent").setup(opts)

    local keys = {
      {
        "<leader>T",
        group = "transparent",
        icon = "🍅",
      },
      {
        "<leader>Te",
        ":TransparentEnable<CR>",
        silent = true,
        desc = "enable transparency",
        icon = "🍑",
      },
      {
        "<leader>Td",
        ":TransparentDisable<CR>",
        silent = true,
        desc = "disable transparency",
        icon = "🍑",
      },
      {
        "<leader>Tt",
        ":TransparentToggle<CR>",
        silent = true,
        desc = "toggle transparency",
        icon = "🍑",
      },
    }

    local wk = require("which-key")
    wk.add(keys)
  end,
}
