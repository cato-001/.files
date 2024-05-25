local nmap = require('maps').nmap

local function scatternotes_keymaps()
  local scatternotes = require('scatternotes')
  nmap('<leader>n', scatternotes.search_note, 'Search [N]otes')
end

local function scatternotes_commands()
  local commands = {
    {
      'Work',
      tags = { 'work', 'date', 'time' }
    },
    {
      'Personal',
      tags = { 'personal', 'date', 'time' }
    }
  }
  local scatternotes = require('scatternotes')
  vim.api.nvim_create_user_command('Work', function()
    scatternotes.create_note({ work = true, date = true, time = true })
  end, {})
  vim.api.nvim_create_user_command('Personal', function()
    scatternotes.create_note({ personal = true, date = true, time = true })
  end, {})
  vim.api.nvim_create_user_command('Meeting', function()
    scatternotes.create_note({ work = true, data = true, time = true, 'meeting' })
  end, {})
  vim.api.nvim_create_user_command('Daily', function()
    scatternotes.create_note({ daily = true })
  end, {})
  vim.api.nvim_create_user_command('Ticket', function()
    scatternotes.create_note({ work = true, date = true, time = true, 'ticket' })
  end, {})
  vim.api.nvim_create_user_command('Research', function()
    scatternotes.create_note({ research = true, work = true })
  end, {})
  vim.api.nvim_create_user_command('Idea', function()
    scatternotes.create_note({ research = true })
  end, {})
  vim.api.nvim_create_user_command('Todo', function()
    scatternotes.create_note({ todo = true, work = true })
  end, {})
  vim.api.nvim_create_user_command('Howto', function()
    scatternotes.create_note({ howto = true })
  end, {})

  vim.api.nvim_create_user_command('NotesCommit', function()
    vim.fn.system('scatternotes commit')
    print('notes committed successfully')
  end, {})
end

return {
  {
    'lukas412/scatternotes.nvim',
    lazy = false,
    init = function()
      scatternotes_keymaps()
      scatternotes_commands()
    end,
    dev = { true }
  }
}
