local function open_plantuml_file_in_browser(event)
  local file = event['file'] or vim.fn.expand('%')
  vim.fn.system({ 'puml', 'open', file })
end

vim.api.nvim_create_user_command('Puml', open_plantuml_file_in_browser, {})

return {}
