local maps = require 'maps'
local nvmap = maps.nvmap

return {
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = false,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
      'nvim-telescope/telescope.nvim',
      'nvim-treesitter'
    },
    opts = {
      workspaces = {
        {
          name = 'notes',
          path = vim.fn.expand '~' .. '/notes',
        }
      }
    },
    init = function()
      vim.api.nvim_create_user_command('Today', ':ObsidianToday', {})
    end
  }
}
