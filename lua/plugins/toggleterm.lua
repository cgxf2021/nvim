return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  version = "*",
  opts = {
    open_mapping = [[<c-\>]],
    start_in_insert = false,
    direction = "float",
    float_opts = {
      border = "single",
      width = function()
        return math.floor(vim.o.columns * 0.40)
      end,
      height = function()
        return math.floor(vim.o.lines * 0.84)
      end,
      row = function()
        return math.floor(vim.o.lines * 0.08)
      end,
      col = function()
        return math.floor(vim.o.columns * 0.58)
      end,
    },
  },
}
