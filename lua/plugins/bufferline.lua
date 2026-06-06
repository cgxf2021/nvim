return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  lazy = false,
  opts = {
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
}
