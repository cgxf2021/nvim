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
      marks = false,
      registers = false,
      spelling = { enabled = true, suggestions = 20 },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    win = {
      no_overlap = true,
      padding = { 1, 2 },
      title = true,
      title_pos = "center",
      zindex = 1000,
      border = "single",
      wo = {
        winblend = vim.g.transparent_background_enabled and 0 or 10,
      },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add(require("core.keymap").keymaps)
  end,
}
