return {
  "mason-org/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mason-org/mason-lspconfig.nvim"
  },
  event = "VeryLazy",
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  },
  config = function(_, opts)
    require("mason").setup(opts)
    local registry = require("mason-registry")

    local function setup(name, config)
      local success, package = pcall(registry.get_package, name)
      if success and not package:is_installed() then
        package:install()
      end
      local nvim_lsp = require("mason-lspconfig.mappings").get_mason_map().package_to_lspconfig[name]
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
              globals = { "vim" }
            }
          }
        }
      },
      -- clangd, c/c++
      ["clangd"] = {},
    }

    for server, config in pairs(servers) do
      setup(server, config)
    end

    vim.cmd("LspStart")
    vim.diagnostic.config({
      virtual_text = true,
      -- update_in_insert = true,
    })
  end
}
