local maps = require 'maps'
local nvmap = maps.nvmap
local nmap = maps.nmap
local vmap = maps.vmap
local imap = maps.imap

local function setup_system_register()
  nvmap('+c', '"+c', '[c]ut')
  nvmap('+C', '"+c$', '[C]ut')

  nvmap('+d', '"+d', '[d]elete')
  nvmap('+D', '"+d$', '[D]elete')

  nvmap('+y', '"+y', '[y]ank')
  nvmap('+Y', '"+y$', '[Y]an')

  nvmap('+p', '"+p', '[p]aste')
  nvmap('+P', '"+P', '[P]aste')

  nmap('+r', 'ciw<c-r>+<esc>', '[r]eplace')
  nmap('+R', 'ciW<c-r>+<esc>', '[R]eplace')
end

local function setup_search()
  local telescope_builtin = require('telescope.builtin')
  nmap('<leader>f', telescope_builtin.find_files, '[f]iles')
  nmap('<leader>d', telescope_builtin.diagnostics, '[d]iagnostics')

  nmap('<leader>s:', telescope_builtin.command_history, '[:] commands')
  nmap('<leader>sh', telescope_builtin.search_history, '[H]istory')
  nmap('<leader>s?', telescope_builtin.help_tags, '[?] help')
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
  nmap('<Esc>', ':noh<Cr>', 'remove search highlight')

  imap('<C-Z>', '<C-V>', 'use <CTRL-Z> to insert special characters', { noremap = true })
  imap('', '<Esc>wdbi', '<CTRL-BS> to delete the current word', { noremap = true })

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
