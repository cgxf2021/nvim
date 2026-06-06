return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
  event = "VeryLazy",
  opts = {
    sign = { enabled = false },
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
}
