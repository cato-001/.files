vim.lsp.start({
  name = 'rickshaw',
  cmd = { 'rickshaw' },
  root_dir = vim.fs.root(0, { '.sln' }),
})

return {}
