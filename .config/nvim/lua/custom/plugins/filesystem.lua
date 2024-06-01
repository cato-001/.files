local maps = require('maps')
local nmap = maps.nmap

return {
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      nmap('<leader>-', function() vim.cmd('Oil') end, 'open parent directory')
    end
  },
}
