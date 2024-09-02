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
    init = function()
      require('ibl').setup()
    end
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
        { 'g',         group = '[g]oto' },
        { '+',         group = '[+] system register' },
        { 'c',         group = '[c]hange' },
        { 'd',         group = '[d]elete' },
        { 'y',         group = '[y]ank' },
        { 'f',         group = '[f]ind' },
        { 'F',         group = '[F]ind backward' },
        { 't',         group = '[t]ill' },
        { 'T',         group = '[T]ill backwards' },
        { 'v',         group = '[v]isual' },
        { 'V',         group = '[V]isual line' },
        { 'q',         group = '[q] record' },
      })
    end
  },
}
