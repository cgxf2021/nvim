return {
  "saghen/blink.cmp",
  dependencies = {
    -- setting up code templates
    "rafamadriz/friendly-snippets"
  },
  version = "1.*",
  event = "VeryLazy",
  opts = {
    completion = {
      documentation = {
        auto_show = true
      }
    },
    keymap = {
      preset = "super-tab"
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" }
    },
    cmdline = {
      enabled = true,
      sources = function()
        local type = vim.fn.getcmdtype()
        if type == '/' or type == '?' then
          return { "buffer" }
        end
        if type == ':' or type == '@' then
          return { "cmdline" }
        end
        return {}
      end,
      keymap = {
        preset = "super-tab"
      },
      completion = {
        menu = { auto_show = true }
      }
    }
  }
}
