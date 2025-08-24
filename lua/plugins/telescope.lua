return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
  },
  cmd = "Telescope",
  opts = {
    extensions = {
      fzf = {
        -- false will only do exact matching
        fuzzy = true,
        -- override the generic sorter
        override_generic_sorter = true,
        -- override the file sorter
        override_file_sorter = true,
        -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
        case_mode = "smart_case",
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
  end,
}
