vim.lsp.start({
  name = 'rickshaw',
  cmd = { 'rickshaw' },
  root_dir = vim.fs.root(0, '.git'),
})

vim.api.nvim_create_user_command('AttachRickshaw', function()
  local buffer = vim.api.nvim_get_current_buf()
  local rickshaw = nil

  for _, value in ipairs(vim.lsp.get_clients()) do
    if value.name == 'rickshaw' then
      rickshaw = value.id
    end
  end

  if rickshaw == nil then
    error('could not find rickshaw language server')
    return
  end
  vim.lsp.buf_attach_client(buffer, rickshaw)
end, {})

return {}
