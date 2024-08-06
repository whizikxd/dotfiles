vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

vim.opt.wrap = true
vim.opt.breakindent = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.colorcolumn = "79"

vim.opt.clipboard = "unnamedplus"

vim.opt.history = 150

vim.opt.laststatus = 0
vim.keymap.set("n", "<leader>vs", function()
  if vim.opt.laststatus:get() == 2 then
    vim.opt.laststatus = 0
  else
    vim.opt.laststatus = 2
  end
end, {silent = true})

vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.local/state/nvim/nvim-undo-dir")

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.list = true
vim.opt.listchars = {
  tab = "->",
  trail = "~",
}

vim.opt.wildignorecase = true

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
  {"bluz71/vim-moonfly-colors",
    lazy = false,
    config = function()
      vim.opt.background = "dark"
      vim.cmd("colorscheme moonfly")
    end,
  },
  {"hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = {border = "none"},
          documentation = {border = "none"}
        },
        mapping = {
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"]     = cmp.mapping.close(),
          ["<C-u>"]     = cmp.mapping.scroll_docs(-4),
          ["<C-d>"]     = cmp.mapping.scroll_docs(4),
          ["<CR>"]      = cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = false,
            }),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, {"i", "s"}),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {"i", "s"}),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          }, {
          { name = "buffer" },
        })
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig["clangd"].setup {
        capabilities = capabilities
      }
    end
  },
  {"nvim-telescope/telescope.nvim",
    lazy = false,
    branch = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        pickers = {
          find_files = {
            hidden = true
          }
        }
      })
      vim.keymap.set("n", "<leader>tt", ":Telescope<CR>",  {silent = true})
      vim.keymap.set("n", "<leader>tf", ":Telescope find_files<CR>", {silent = true})
      vim.keymap.set("n", "<leader>tm", ":Telescope man_pages<CR>",  {silent = true})
      vim.keymap.set("n", "<leader>tb", ":Telescope buffers<CR>",  {silent = true})
    end
  },
  {"stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local oil = require("oil")
      oil.setup({
        default_file_explorer = true,
        constrain_cursor = "name",
        delete_to_trash = false,
        skip_confirm_for_simple_edits = true,
        columns = {
          "icon",
          "permissions",
          "size"
        },
        keymaps = {
          ["g?"]    = "actions.show_help",
          ["<CR>"]  = "actions.select",
          ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
          ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
          ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"]     = "actions.parent",
          ["_"]     = "actions.open_cwd",
          ["`"]     = "actions.cd",
          ["~"]     = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
          ["gs"]    = "actions.change_sort",
          ["gx"]    = "actions.open_external",
          ["g."]    = "actions.toggle_hidden",
          ["g\\"]   = "actions.toggle_trash"
        }
      })

      vim.keymap.set("n", "<leader>vo", ":Oil<CR>", {silent = true})
    end,
  }
})


