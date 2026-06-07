-- basic configuration

vim.g.transparent_background_enabled = false

-- line number settings
vim.opt.number = true
vim.opt.relativenumber = true

-- highlight current line
vim.opt.cursorline = true

-- tabs and indents
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0

-- reload external changes
vim.opt.autoread = true

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI", "TermClose" }, {
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.INFO)
  end,
})

-- split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- case sensitivity
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cancel hightlighting when search is finished
vim.opt.hlsearch = false

-- disable default show info
vim.opt.showmode = false

-- code folding and expansion
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevel = 99

local function set_indent(size)
  vim.opt_local.expandtab = true
  vim.opt_local.tabstop = size
  vim.opt_local.shiftwidth = size
  vim.opt_local.softtabstop = size
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "h", "hpp", "python", "proto", "cmake" },
  callback = function()
    set_indent(4)
  end,
})

local function set_transparent_highlights()
  if not vim.g.transparent_background_enabled then
    return
  end

  local groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "SignColumn",
    "EndOfBuffer",
    "StatusLine",
    "StatusLineNC",
    "LazyNormal",
    "MasonNormal",
    "MasonBorder",
    "WhichKeyNormal",
    "WhichKeyBorder",
    "WhichKeyTitle",
  }

  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE" })
  end
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_transparent_highlights,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lazy", "mason", "wk" },
  callback = function()
    if vim.g.transparent_background_enabled then
      set_transparent_highlights()
    end
  end,
})
