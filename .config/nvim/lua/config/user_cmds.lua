function setup()
  vim.api.nvim_create_user_command('W', 'w', {})
  vim.api.nvim_create_user_command('Wq', 'wq', {})
  vim.api.nvim_create_user_command('WQ', 'wq', {})
  vim.api.nvim_create_user_command('Wa', 'wa', {})
  vim.api.nvim_create_user_command('WA', 'wa', {})
end

return {
  setup = setup
}
