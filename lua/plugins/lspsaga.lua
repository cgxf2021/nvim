return {
  "nvimdev/lspsaga.nvim",
  cmd = "Lspsaga",
  opts = {
    ui = {
      -- border type can be single, double, rounded, solid, shadow.
      border = "rounded",
      code_action = "",
    },
  },
  config = function(_, opts)
    require("lspsaga").setup(opts)
  end,
}
