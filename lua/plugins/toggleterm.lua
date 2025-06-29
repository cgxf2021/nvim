return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  version = "*",
  opts = {
    open_mapping = [[<c-\>]],
    -- do not start in insert mode
    start_in_insert = false,
    -- float terminal
    direction = "float",
    float_opts = {
      border = "single",
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)
  end,
}
