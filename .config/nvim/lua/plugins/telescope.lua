return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  branch = "0.1.x",
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
        },
        live_grep = {
          additional_args = {
            "--hidden"
          }
        }
      }
    })
    vim.keymap.set("n", "<leader>t", ":Telescope<CR>",  { silent = true })
    vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", { silent = true })
    vim.keymap.set("n", "<leader>m", ":Telescope man_pages<CR>",  { silent = true })
    vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>",  { silent = true })
    vim.keymap.set("n", "<leader>g", ":Telescope live_grep<CR>",  { silent = true })
  end
}
