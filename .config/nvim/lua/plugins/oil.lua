return {
  "stevearc/oil.nvim",
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
        ["gs"]    = "actions.change_sort",
        ["gx"]    = "actions.open_external",
        ["g."]    = "actions.toggle_hidden",
        ["g\\"]   = "actions.toggle_trash",
        ["<C-u>"] = "actions.preview_scroll_up",
        ["<C-d>"] = "actions.preview_scroll_down"
      }
    })

    vim.keymap.set("n", "<leader>vo", ":Oil<CR>", { silent = true })
  end,
}
