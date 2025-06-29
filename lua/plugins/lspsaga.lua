return {
  "nvimdev/lspsaga.nvim",
  cmd = "Lspsaga",
  opts = {},
  config = function(_, opts)
    require("lspsaga").setup(opts)
  end,
}
