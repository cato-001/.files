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
    },
    init = function()
      vim.api.nvim_create_user_command('Today', ':ObsidianToday', {})
      vim.api.nvim_create_user_command('Yesterday', ':ObsidianYesterday', {})
      vim.api.nvim_create_user_command('Tomorrow', ':ObsidianTomorrow', {})
    end
  }
}
