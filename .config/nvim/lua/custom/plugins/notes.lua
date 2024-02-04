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
          name = 'personal',
          path = vim.fn.expand '~' .. '/vaults/personal',
        },
        {
          name = 'work',
          path = vim.fn.expand '~' .. '/vaults/work',
        }
      }
    },
    init = function()
    end
  }
}
