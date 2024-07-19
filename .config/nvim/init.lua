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

vim.opt.wildignorecase = true

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
--  {"ellisonleao/gruvbox.nvim", lazy = false},--, config = true, opts = ...},
  {"bluz71/vim-moonfly-colors", lazy = false}, --, priority = 1000 },
  {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    { "ms-jpq/coq_nvim", branch = "coq" },
    { "ms-jpq/coq.artifacts", branch = "artifacts" },
    { 'ms-jpq/coq.thirdparty', branch = "3p" }
  },
  init = function()
    vim.g.coq_settings = {
      auto_start = "shut-up", -- Makes it not display a startup message
      display = {
        pum = {
          fast_close = true,
          source_context = {"[", "]"}
        },
        ghost_text = {
          enabled = true,
          context = {" ", " "},
          highlight_group = "Comment"
        },
        preview = {
          border = "solid"
        },
        icons = {
          mode = "short"
        }
      },
      completion = {
        always = false -- Need to press ctrl + space to trigger completion window
      }
    }
  end
  }
})

vim.opt.background = "dark"
vim.cmd("colorscheme moonfly")

local coq = require("coq")
local lspconfig = require("lspconfig")
lspconfig.clangd.setup{}
lspconfig.clangd.setup(coq.lsp_ensure_capabilities({}))

