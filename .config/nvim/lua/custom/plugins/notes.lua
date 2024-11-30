return {
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
      },
      calender = {
        today = {
          command = 'Today'
        }
      },
      modules = {
        jira = {},

        dprint = {},
        pandoc = {},
        split = {},
        scripting = {}
      },
    },
    dir = "~/projects/scatter.nvim",
    config = true,
  }
}
