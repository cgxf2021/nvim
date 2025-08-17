return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  lazy = false,
  opts = {
    highlights = {},
    options = {
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(_, _, diagnostics_dict, _)
        local indicator = " "
        for level, number in pairs(diagnostics_dict) do
          local symbol
          if level == "error" then
            symbol = "  "
          elseif level == "warning" then
            symbol = "  "
          else
            symbol = "  "
          end
          indicator = indicator .. number .. symbol
        end
        return indicator
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          highlight = "Directory",
          separator = true,
        },
      },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    local keys = {
      {
        "<leader>b",
        group = "bufferline",
        icon = "🍅",
      },
      {
        "<leader>bh",
        ":BufferLineCyclePrev<CR>",
        silent = true,
        desc = "switch to the previous buffer",
        icon = "🍑",
      },
      {
        "<leader>bl",
        ":BufferLineCycleNext<CR>",
        silent = true,
        desc = "switch to the next buffer",
        icon = "🍑",
      },
      {
        "<leader>bd",
        ":bdelete<CR>",
        silent = true,
        desc = "delete the current buffer",
        icon = "🍑",
      },
      {
        "<leader>bp",
        ":BufferLinePick<CR>",
        silent = true,
        desc = "select to switch to a buffer",
        icon = "🍑",
      },
    }

    local wk = require("which-key")
    wk.add(keys)
  end,
}
