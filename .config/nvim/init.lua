vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

vim.opt.wrap = true
vim.opt.breakindent = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.colorcolumn = "79"

vim.opt.clipboard = "unnamedplus"

vim.opt.history = 150

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 20
vim.g.netrw_keepdir = 0
vim.g.netrw_sort_sequence = [[[\/]$,*]]
vim.g.netrw_sizestyle = "H"
-- vim.g.netrw_browse_split = 2

vim.opt.list = true
vim.opt.listchars = {
  tab = "->",
  trail = "~",
--  extends = ">",
--  precedes = "<",
--  space = ".",
}

-- Block cursor for every mode 
-- vim.cmd("set guicursor=n-v-c-i:block-Cursor")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {"ellisonleao/gruvbox.nvim", lazy = false, config = true, opts = ...},
})

vim.opt.background = "dark"
vim.cmd("colorscheme gruvbox")

