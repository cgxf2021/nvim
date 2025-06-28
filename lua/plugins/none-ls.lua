return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	config = function()
		local registry = require("mason-registry")
		local function format_install(name)
			local success, format = pcall(registry.get_package, name)
			if success and not format:is_installed() then
        format:install()
			end
		end

		-- install stylua
		format_install("stylua")

		-- install clang-format
		format_install("clang-format")

    -- install python black
    format_install("black")

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
