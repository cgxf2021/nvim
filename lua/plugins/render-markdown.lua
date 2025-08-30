return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    sign = {
      enabled = false,
    },
    heading = {
      position = "inline",
      width = "block",
      min_width = 30,
    },
    code = {
      width = "block",
      min_width = 45,
    },
  },
  event = "VeryLazy",
  config = function(_, opts)
    require("render-markdown").setup(opts)
  end,
}
