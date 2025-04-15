function setup()
  vim.api.nvim_create_user_command('W', 'w', {})
  vim.api.nvim_create_user_command('Wq', 'wq', {})
  vim.api.nvim_create_user_command('WQ', 'wq', {})
end

return {
  setup = setup
}
