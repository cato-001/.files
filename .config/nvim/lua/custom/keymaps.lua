local maps = require 'maps'
local nvmap = maps.nvmap
local nmap = maps.nmap
local vmap = maps.vmap
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
  nmap('<leader>f', require('telescope.builtin').find_files, '[f]iles')

  local telescope_builtin = require('telescope.builtin')
  nmap('<leader>s:', telescope_builtin.command_history, '[:] commands')
  nmap('<leader>sh', telescope_builtin.search_history, '[H]istory')
  nmap('<leader>s?', telescope_builtin.help_tags, '[?] help')
  nmap('<leader>sd', telescope_builtin.diagnostics, '[d]iagnostics')
  nmap('<leader>sg', telescope_builtin.live_grep, '[g]rep')
  nmap('<leader>sr', telescope_builtin.resume, '[r]esume')
  nmap('<leader>sw', telescope_builtin.grep_string, '[w]ord')

  nmap('<leader>gf', telescope_builtin.git_files, '[f]iles')
end

local function setup_gotos()
end

local function setup_editor_defaults()
  nmap('U', '<C-R>', 'Redo')
  nmap('V', 'V_', 'Goto start in Visual-Line Mode')

  imap('<C-Z>', '<C-V>', 'use <CTRL-Z> to insert special characters', { noremap = true })
  imap('', '<Esc>dBxi', '<CTRL-BS> to delete the current word', { noremap = true })

  vmap('>', '>gv_', 'reselect after indenting')
  vmap('<', '<gv_', 'reselect after dedenting')
end

local function setup()
  nvmap('<Space>', '<Nop>', 'Leader', { silent = true })
end

return {
  setup = setup,
  setup_search = setup_search,
  setup_gotos = setup_gotos,
  setup_system_register = setup_system_register,
  setup_editor_defaults = setup_editor_defaults,
}
