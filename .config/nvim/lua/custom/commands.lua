local function setup_autoformat(filetypes)
  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = filetypes,
    callback = function() vim.lsp.buf.format() end
  })
end

return {
  setup_autoformat = setup_autoformat,
}
