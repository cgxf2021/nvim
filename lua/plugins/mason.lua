return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	event = "VeryLazy",
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
		local registry = require("mason-registry")
		local mason_lsp_mappings = require("mason-lspconfig.mappings")

		local function lsp_install(name, config)
			local success, lsp_package = pcall(registry.get_package, name)
			if success and not lsp_package:is_installed() then
				lsp_package:install()
			end
			local nvim_lsp = mason_lsp_mappings.get_mason_map().package_to_lspconfig[name]

			-- code autocomplete
			config.capabilities = require("blink.cmp").get_lsp_capabilities()
			-- code formatting
			config.on_attach = function(client)
				-- disable lsp server formatting and range formatting
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end
			vim.lsp.config(nvim_lsp, config)
		end

		local servers = {
			-- lua language server
			["lua-language-server"] = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
			-- clangd
			["clangd"] = {},

			-- python lsp server
			["python-lsp-server"] = {},
		}

		for server, config in pairs(servers) do
			lsp_install(server, config)
		end

		vim.diagnostic.config({
			virtual_text = true,
			-- update_in_insert = true,
		})

		-- auto start lsp
		require("mason-lspconfig").setup({
			ensure_installed = {},
			automatic_enable = {
				"lua_ls",
				"clangd",
				"pylsp",
			},
		})
	end,
}
