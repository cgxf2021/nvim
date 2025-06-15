return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		filter = function(mapping)
			return mapping.desc and mapping.desc ~= ""
		end,
	}
}
