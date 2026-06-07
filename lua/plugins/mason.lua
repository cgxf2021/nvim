return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  event = "VeryLazy",
  opts = {
    ui = {
      backdrop = vim.g.transparent_background_enabled and 100 or 60,
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

      config.capabilities = require("blink.cmp").get_lsp_capabilities()
      config.on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end
      vim.lsp.config(nvim_lsp, config)
      vim.lsp.enable(nvim_lsp)
    end

    local get_clangd_container_params = function()
      local path = require("lspconfig.util").path
      local current_dir = vim.loop.cwd()
      local container_file_path = path.join(current_dir, ".container-nvim")
      local container_name = nil
      local path_mappings = nil

      if path.exists(container_file_path) then
        local file = io.open(container_file_path, "r")
        if file then
          container_name = file:read("*l")
          path_mappings = file:read("*l")
          file:close()
          container_name = container_name and container_name:match("%S+")
          path_mappings = path_mappings and path_mappings:match("%S+")
          if container_name and path_mappings then
            print("container_name: " .. container_name)
            print("path_mappings: " .. path_mappings)
            return container_name, path_mappings
          end
        end
      end
      return "none-container", "none-path-mappings"
    end

    local container_name, path_mappings = get_clangd_container_params()

    local servers = {
      ["lua-language-server"] = {
        filetypes = { "lua" },
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      },
      ["clangd"] = {
        cmd = {
          "remote-clangd.sh",
          container_name,
          path_mappings,
        },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      },
      ["python-lsp-server"] = {
        filetypes = { "python" },
      },
      ["buf"] = {
        filetypes = { "proto" },
      },
      ["cmake-language-server"] = {
        filetypes = { "cmake" },
      },
      ["marksman"] = {
        filetypes = { "markdown" },
      },
    }

    for server, config in pairs(servers) do
      lsp_install(server, config)
    end

    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local icon
          if diagnostic.severity == vim.diagnostic.severity.ERROR then
            icon = "🐛"
          elseif diagnostic.severity == vim.diagnostic.severity.WARN then
            icon = "⚠️"
          elseif diagnostic.severity == vim.diagnostic.severity.INFO then
            icon = "💡"
          elseif diagnostic.severity == vim.diagnostic.severity.HINT then
            icon = "💭"
          end
          return icon .. " " .. diagnostic.message
        end,
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {},
      automatic_enable = {
        "lua_ls",
        "clangd",
        "pylsp",
        "buf_ls",
        "cmake",
        "markdown_oxide",
      },
    })
  end,
}
