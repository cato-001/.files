local function setup_autoformat(filetypes)
  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = filetypes,
    command = ':Format'
  })
end

return {
  setup_autoformat = setup_autoformat
}
