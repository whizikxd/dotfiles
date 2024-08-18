  return {
    "bluz71/vim-moonfly-colors",
    lazy = false,
    config = function()
      vim.opt.background = "dark"
      vim.cmd("colorscheme moonfly")
    end,
  }
