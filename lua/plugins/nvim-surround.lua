return {
  "kylechui/nvim-surround",
  version = "^3.0.0",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({})
  end,
}

-- add: ys{motion}{char}, ysiw": "surr*ound"
--   add html tag: ysiwtp<CR>: <p>surround</p>
-- delete: ds{char}, ds": surr*ound
--   delete html tag: dst: surround
-- change: cs{target}{replacement}, cs"': 'surr*ound'
--   change html tag: cstdiv<CR>: <div>surround</div>
