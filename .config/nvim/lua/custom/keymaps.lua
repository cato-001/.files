local maps = require 'maps'
local nvmap = maps.nvmap
local nmap = maps.nmap
local imap = maps.imap

local function setup_system_register()
  nvmap('+c', '"+c', '[C]ut (system register)')
  nvmap('+C', '"+c$', '[C]ut (system register)')

  nvmap('+d', '"+d', '[D]elete (system register)')
  nvmap('+D', '"+d$', '[D]elete (system register)')

  nvmap('+y', '"+y', '[Y]ank (system register)')
  nvmap('+Y', '"+y$', '[Y]ank (system register)')

  nvmap('+p', '"+p', '[P]aste (system register)')
  nvmap('+P', '"+P', '[P]aste (system register)')

  nmap('+r', 'ciw<c-r>+<esc>', '[R]eplace (system register)')
  nmap('+R', 'ciW<c-r>+<esc>', '[R]eplace (system register)')
end

local function setup_search()
  nmap('<leader>f', require('telescope.builtin').find_files, 'Search [F]iles')

  nmap('<leader>sa', ':ObsidianSearch #active<cr><esc>', '[S]earch [A]ctive note')
  nmap('<leader>st', ':ObsidianSearch #todo<cr><esc>', '[S]earch [T]odo note')

  local telescope_builtin = require('telescope.builtin')
  nmap('<leader>s:', telescope_builtin.command_history, '[S]earch [:] command history')
  nmap('<leader>sh', telescope_builtin.search_history, '[S]earch [H]istory')

  nmap('<leader>s?', telescope_builtin.help_tags, '[S]earch [?] help')

  nmap('<leader>gf', telescope_builtin.git_files, 'Search [G]it [F]iles')
  nmap('<leader>sd', telescope_builtin.diagnostics, '[S]earch [D]iagnostics')
  nmap('<leader>sg', telescope_builtin.live_grep, '[S]earch by [G]rep')
  nmap('<leader>sr', telescope_builtin.resume, '[S]earch [R]esume')
  nmap('<leader>sw', telescope_builtin.grep_string, '[S]earch current [W]ord')
end

local function setup_gotos()
end

local function setup_editor_defaults()
  nmap('U', '<C-R>', 'Redo')
  nmap('V', 'V_', 'Goto start in Visual-Line Mode')

  imap('<C-Z>', '<C-V>', 'use <CTRL-Z> to insert special characters', { noremap = true })
  imap('', '<Esc>ciw', '<CTRL-BS> to delete the current word', { noremap = true })
end

local function setup()
  nvmap('<Space>', '<Nop>', 'prevent space from doing anything', { silent = true })
end

return {
  setup = setup,
  setup_search = setup_search,
  setup_gotos = setup_gotos,
  setup_system_register = setup_system_register,
  setup_editor_defaults = setup_editor_defaults,
}
