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
          hidden = true,
          file_ignore_patterns = {
            ".git/"
          }
        },
        live_grep = {
          additional_args = {
            "--hidden"
          },
          glob_pattern = {
            "!.git/**"
          }
        }
      }
    })
    vim.keymap.set("n", "<leader>t", ":Telescope<CR>",  { silent = true })
    vim.keymap.set("n", "\\", ":Telescope find_files<CR>", { silent = true })
    vim.keymap.set("n", "'", ":Telescope live_grep<CR>",  { silent = true })
  end
}
