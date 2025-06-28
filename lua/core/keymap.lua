-- bind shortcut keys
-- vim.keymap.set(mode, lhs, rhs, opts)
-- mode: n(normal), i(insert) eg: 'n', {'n', 'i'}
-- lhs: keys eg: <C-a> -> Ctrl + a, <A-a> -> Alt + a
-- rhs: function/commands eg: "<Cmd>lua print('hello world')<CR>"
-- opts: table, additional configuration
-- opts: eg: silent -> show command in command line { silent = true }
-- opts: eg: remap -> recursive mapping { remap = true }

-- leader key
vim.g.mapleader = " "
-- local leader key
vim.g.maplocalleader = ","

local M = {}

M.keymaps = {
	{
		"<leader>w",
		group = "windows",
		icon = "🍅",
	},
	{
		"<leader>wh",
		"<C-w>h",
		silent = true,
		desc = "switch to the left win",
		icon = "🍑",
	},
	{
		"<leader>wl",
		"<C-w>l",
		silent = true,
		desc = "switch to the right win",
		icon = "🍑",
	},
	{
		"<leader>wk",
		"<C-w>k",
		silent = true,
		desc = "switch to the top win",
		icon = "🍑",
	},
	{
		"<leader>wj",
		"<C-w>k",
		silent = true,
		desc = "switch to the bottom win",
		icon = "🍑",
	},
	{
		"<leader>ws",
		"<C-w>s",
		silent = true,
		desc = "split current win horizontally",
		icon = "🍑",
	},
	{
		"<leader>wv",
		"<C-w>v",
		silent = true,
		desc = "split current win vertically",
		icon = "🍑",
	},
	{
		"<leader>wq",
		"<C-w>c",
		silent = true,
		desc = "close current win",
		icon = "🍑",
	},
}

return M
