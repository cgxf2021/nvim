return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    renderer = {
      icons = {
        glyphs = {
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    filters = {
      enable = true,
      git_ignored = false,
      dotfiles = false,
      git_clean = false,
      no_buffer = false,
      no_bookmark = false,
      custom = {},
      exclude = {},
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
    local keys = {
      {
        "<leader>t",
        group = "tree",
        icon = "🍅",
      },
      {
        "<leader>te",
        ":NvimTreeToggle<CR>",
        silent = true,
        desc = "open or close the tree",
        icon = "🍑",
      },
      {
        "<leader>tc",
        ":NvimTreeCollapse<CR>",
        silent = true,
        desc = "collapses the tree recursively",
        icon = "🍑",
      },
      {
        "<leader>tf",
        ":NvimTreeFindFile<CR>",
        silent = true,
        desc = "find current file in the tree",
        icon = "🍑",
      },
    }
    local wk = require("which-key")
    wk.add(keys)
  end,
}
