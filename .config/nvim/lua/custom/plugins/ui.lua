return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
      flavour = 'mocha',
      transparent_background = true,
    },
    init = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'catppuccin-mocha',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
  },
  {
    'folke/which-key.nvim',
    opts = {},
    init = function()
      local which_key = require('which-key')
      which_key.setup({
        preset = 'helix',
      })
      which_key.add({
        { '<leader>-', desc = '[-] directory' },
        { '<leader>f', desc = '[f]iles' },
        { '<leader>r', desc = '[r]ename' },
        { '<leader>s', group = '[s]earch' },
        { '<leader>g', group = '[g]it' },
        { '<leader>n', desc = '[n]otes' },
        { '<leader>N', group = '[N]otes' },
        { '<leader>w', group = '[w]orkspace' },
        { 'g',         group = '[g]oto' }
      })
    end
  },
}
