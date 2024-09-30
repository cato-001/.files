return {
  {
    'lukas412/scatternotes.nvim',
    lazy = false,
    init = function()
      require('scatternotes').setup({
        keymaps = {
          commit = { '<leader>Nc', desc = '[N]otes [C]ommit' },
        },
      })
    end,
    dev = { true }
  },
  {
    'cato-001/scatter.nvim',
    lazy = false,
    opts = {
      notes = {
        commands = {
          create = {
            ['Personal'] = { 'personal', 'date', 'time' },
            ['Work']     = { 'work', 'date', 'time' },
            ['Meeting']  = { 'work', 'meeting', 'date', 'time' },
            ['Daily']    = { 'work', 'meeting', 'daily', 'date', 'time', 'pim' },
            ['PimDaily'] = { 'work', 'meeting', 'daily', 'date', 'time', 'pim' },
            ['Ticket']   = { 'work', 'ticket', 'date', 'time' },
            ['Research'] = { 'work', 'research', 'date', 'time' },
            ['Idea']     = { 'work', 'idea', 'date', 'time' },
            ['Todo']     = { 'work', 'todo', 'date', 'time' },
            ['Howto']    = { 'work', 'research', 'howto', 'date', 'time' },
          },
        },
        keymaps = {
          search = { '<leader>n', desc = 'Search [n]otes' },
        }
      }
    },
    dir = "~/projects/scatter.nvim",
    config = true,
  }
}
