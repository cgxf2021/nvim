return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  opts = {},
  config = function(_, opts)
    require("supermaven-nvim").setup(opts)
  end,
}
