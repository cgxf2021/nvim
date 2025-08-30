return {
  "saghen/blink.cmp",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
    },
    -- setting up code templates
    "rafamadriz/friendly-snippets",
    -- copilot blink cmp
    -- "giuxtaposition/blink-cmp-copilot",
  },
  version = "1.*",
  event = "VeryLazy",
  opts = {
    completion = {
      documentation = {
        auto_show = true,
      },
    },
    keymap = {
      preset = "super-tab",
    },
    snippets = { preset = "luasnip" },
    sources = {
      -- default = { "copilot", "lsp", "path", "snippets", "buffer" },
      default = { "lsp", "path", "snippets", "buffer" },
      -- providers = {
      --   copilot = {
      --     name = "copilot",
      --     module = "blink-cmp-copilot",
      --     score_offset = 100,
      --     async = true,
      --   },
      -- },
    },
    cmdline = {
      enabled = true,
      sources = function()
        local type = vim.fn.getcmdtype()
        if type == "/" or type == "?" then
          return { "buffer" }
        end
        if type == ":" or type == "@" then
          return { "cmdline" }
        end
        return {}
      end,
      keymap = {
        preset = "super-tab",
      },
      completion = {
        menu = { auto_show = true },
      },
    },
  },
  config = function(_, opts)
    require("blink.cmp").setup(opts)
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip").filetype_extend("c", { "cdoc" })
    require("luasnip").filetype_extend("cpp", { "cppdoc" })
  end,
}
