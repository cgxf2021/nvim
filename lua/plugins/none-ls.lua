return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	config = function()
		local registry = require("mason-registry")
		local function install(name)
			local success, package = pcall(registry.get_package, name)
			if success and not package:is_installed() then
				package:install()
			end
		end

		-- install stylua
		install("stylua")

		-- install clang-format
		install("clang-format")

		local none_ls = require("null-ls")
		none_ls.setup({
			sources = {
				none_ls.builtins.formatting.stylua,
				none_ls.builtins.formatting.clang_format,
			},
		})
	end,
	keys = {
		{ "<leader>lf", vim.lsp.buf.format },
	},
}
