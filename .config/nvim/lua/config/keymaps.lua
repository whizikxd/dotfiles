function setup()
  vim.keymap.set("n", "<leader>vs", function()
    if vim.opt.laststatus:get() == 2 then
      vim.opt.laststatus = 1
    else
      vim.opt.laststatus = 2
    end
  end, { silent = true })
end

return {
  setup = setup
}
