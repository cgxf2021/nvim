return {
  "xiyaowong/transparent.nvim",
  opts = {
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
    extra_groups = {
      "NormalFloat",
      "NvimTreeNormal",
    },
    exclude_groups = {},
    on_clear = function() end,
  },
  config = function(_, opts)
    require("transparent").setup(opts)
    vim.api.nvim_create_autocmd("WinEnter", {
      callback = function()
        if vim.api.nvim_win_get_config(0).relative ~= "" then
          vim.schedule(function()
            vim.api.nvim_set_hl(0, "LazyNormal", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "LazyBorder", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MasonNormal", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MasonBorder", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "WhichKeyBorder", { bg = "NONE" })
          end)
        end
      end,
    })
  end,
}
