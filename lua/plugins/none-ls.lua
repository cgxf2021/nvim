return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    local registry = require("mason-registry")
    local function format_install(name)
      local success, format = pcall(registry.get_package, name)
      if success and not format:is_installed() then
        format:install()
      end
    end

    format_install("stylua")
    format_install("clang-format")
    format_install("black")
    format_install("cmakelang")

    local none_ls = require("null-ls")
    none_ls.setup({
      sources = {
        none_ls.builtins.formatting.stylua,
        none_ls.builtins.formatting.custom_clang_format,
        none_ls.builtins.formatting.black,
        none_ls.builtins.formatting.cmake_format,
        none_ls.builtins.formatting.buf,
      },
    })
  end,
}
