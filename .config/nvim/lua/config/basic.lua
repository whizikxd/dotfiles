function setup()
  vim.cmd("filetype on");
  vim.cmd("filetype plugin on");
  vim.cmd("filetype indent on");
  vim.cmd("filetype plugin indent on");
  -- Disable netrw
  vim.g.loaded_netrw       = 1
  vim.g.loaded_netrwPlugin = 1
  vim.g.mapleader          = " "
  vim.g.maplocalleader     = " "

  vim.opt.guicursor      = ""
  vim.opt.number         = true
  vim.opt.relativenumber = true
  vim.opt.ignorecase     = true
  vim.opt.smartcase      = true
  vim.opt.hlsearch       = true
  vim.opt.wrap           = true
  vim.opt.breakindent    = true
  vim.opt.tabstop        = 2
  vim.opt.shiftwidth     = 2
  vim.opt.expandtab      = true
  vim.opt.colorcolumn    = "80"
  vim.opt.clipboard      = "unnamedplus"
  vim.opt.history        = 150
  vim.opt.undofile       = true
  vim.opt.undodir        = vim.fn.expand("~/.local/state/nvim/nvim-undo-dir")
  vim.opt.list           = true
  vim.opt.wildignorecase = true
  vim.opt.cursorline     = true
  vim.opt.laststatus     = 0
  vim.opt.listchars      = {
    tab = "  ",
    lead = "~",
    trail = "~",
  }
end

return {
  setup = setup
}
