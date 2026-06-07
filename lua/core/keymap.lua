vim.g.mapleader = " "
vim.g.maplocalleader = ","

local M = {}

M.keymaps = {
  { "<leader>w", group = "windows", icon = "🍉" },
  { "<leader>wh", "<C-w>h", silent = true, desc = "left window", icon = "🍑" },
  { "<leader>wl", "<C-w>l", silent = true, desc = "right window", icon = "🍑" },
  { "<leader>wk", "<C-w>k", silent = true, desc = "top window", icon = "🍑" },
  { "<leader>wj", "<C-w>j", silent = true, desc = "bottom window", icon = "🍑" },
  { "<leader>ws", "<C-w>s", silent = true, desc = "split horiz", icon = "🍑" },
  { "<leader>wv", "<C-w>v", silent = true, desc = "split vert", icon = "🍑" },
  { "<leader>wq", "<C-w>c", silent = true, desc = "close window", icon = "🍑" },

  { "<leader>z", group = "folding", icon = "🍊" },
  { "<leader>zc", "zc", silent = true, desc = "collapse one", icon = "🍑" },
  { "<leader>zo", "zo", silent = true, desc = "expand one", icon = "🍑" },
  { "<leader>zC", "zM", silent = true, desc = "collapse all", icon = "🍑" },
  { "<leader>zO", "zR", silent = true, desc = "expand all", icon = "🍑" },

  { "<leader>b", group = "buffer", icon = "🍑" },
  { "<leader>bh", ":BufferLineCyclePrev<CR>", silent = true, desc = "prev buffer", icon = "🍑" },
  { "<leader>bl", ":BufferLineCycleNext<CR>", silent = true, desc = "next buffer", icon = "🍑" },
  { "<leader>bd", ":bdelete<CR>", silent = true, desc = "delete buffer", icon = "🍑" },
  { "<leader>bp", ":BufferLinePick<CR>", silent = true, desc = "pick buffer", icon = "🍑" },

  { "<leader>s", group = "search", icon = "🐍" },
  { "<leader>sf", ":Telescope find_files<CR>", silent = true, desc = "find files", icon = "🍑" },
  { "<leader>sg", ":Telescope live_grep<CR>", silent = true, desc = "live grep", icon = "🍑" },
  { "<leader>sb", ":Telescope buffers<CR>", silent = true, desc = "buffers", icon = "🍑" },
  { "<leader>sh", ":Telescope help_tags<CR>", silent = true, desc = "help tags", icon = "🍑" },

  { "<leader>l", group = "lsp", icon = "🦇" },
  { "<leader>lr", ":Lspsaga rename<CR>", silent = true, desc = "rename", icon = "🍑" },
  { "<leader>ld", ":Lspsaga goto_definition<CR>", silent = true, desc = "definition", icon = "🍑" },
  { "<leader>lc", ":Lspsaga code_action<CR>", silent = true, desc = "code action", icon = "🍑" },
  { "<leader>lh", ":Lspsaga hover_doc<CR>", silent = true, desc = "hover doc", icon = "🍑" },
  { "<leader>lF", ":Lspsaga finder<CR>", silent = true, desc = "finder", icon = "🍑" },
  { "<leader>ln", ":Lspsaga diagnostic_jump_next<CR>", silent = true, desc = "next diagnostic", icon = "🍑" },
  { "<leader>lp", ":Lspsaga diagnostic_jump_prev<CR>", silent = true, desc = "prev diagnostic", icon = "🍑" },

  { "<leader>t", group = "tree", icon = "🐢" },
  { "<leader>te", ":NvimTreeToggle<CR>", silent = true, desc = "toggle tree", icon = "🍑" },
  { "<leader>tc", ":NvimTreeCollapse<CR>", silent = true, desc = "collapse tree", icon = "🍑" },
  { "<leader>tf", ":NvimTreeFindFile<CR>", silent = true, desc = "find file", icon = "🍑" },

  { "<leader>f", group = "format", icon = "🧹" },
  { "<leader>ff", vim.lsp.buf.format, silent = true, desc = "format code", icon = "🍑" },

  { "<leader>o", group = "opencode", icon = "🤖" },
  { "<leader>oo", function() require("opencode.config").opts.server.toggle() end, desc = "toggle terminal", icon = "🍑" },
  { "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, desc = "ask", icon = "🍑" },
  { "<leader>os", function() require("opencode").select() end, desc = "select", icon = "🍑" },
  { "<leader>or", function() return require("opencode").operator("@this ") end, expr = true, desc = "add range", icon = "🍑" },
  { "<leader>ol", function() return require("opencode").operator("@this ") .. "_" end, expr = true, desc = "add line", icon = "🍑" },
  { "<leader>ou", function() require("opencode").command("session.half.page.up") end, desc = "scroll up", icon = "🍑" },
  { "<leader>od", function() require("opencode").command("session.half.page.down") end, desc = "scroll down", icon = "🍑" },
}

return M
