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
      },
      sort_by = "created",
      sort_reversed = true,
      picker = {
        mappings = {
          new = '<C-n>',
          insert_link = '<C-p>'
        }
      },
    },
    init = function()
      vim.api.nvim_create_user_command('Today', 'ObsidianToday', {})
      vim.api.nvim_create_user_command('Yesterday', 'ObsidianYesterday', {})
      vim.api.nvim_create_user_command('Tomorrow', 'ObsidianTomorrow', {})
    end
  },
  {
    'lukas412/scatternotes.nvim',
    lazy = false,
    init = function()
      print('init')
      vim.api.nvim_create_user_command('Work', function()
        require('scatternotes').create_note({ work = true, date = true, time = true })
      end, {})
      vim.api.nvim_create_user_command('Personal', function()
        require('scatternotes').create_note({ personal = true, date = true, time = true })
      end, {})
      vim.api.nvim_create_user_command('Meeting', function()
        require('scatternotes').create_note({ work = true, data = true, time = true, "meeting" })
      end, {})
      vim.api.nvim_create_user_command('Daily', function()
        require('scatternotes').create_note({ daily = true })
      end, {})
      vim.api.nvim_create_user_command('Research', function()
        require('scatternotes').create_note({ research = true, work = true })
      end, {})
      vim.api.nvim_create_user_command('Idea', function()
        require('scatternotes').create_note({ research = true })
      end, {})
      vim.api.nvim_create_user_command('Todo', function()
        require('scatternotes').create_note({ todo = true, work = true })
      end, {})
      vim.api.nvim_create_user_command('Howto', function()
        require('scatternotes').create_note({ howto = true })
      end, {})
    end,
    dev = { true }
  }
}
