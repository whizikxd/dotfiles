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
        }
      }
    })
    vim.keymap.set("n", "<leader>tt", ":Telescope<CR>",  { silent = true })
    vim.keymap.set("n", "<leader>tf", ":Telescope find_files<CR>", { silent = true })
    vim.keymap.set("n", "<leader>tm", ":Telescope man_pages<CR>",  { silent = true })
    vim.keymap.set("n", "<leader>tb", ":Telescope buffers<CR>",  { silent = true })
  end
}
