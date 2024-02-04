local maps = require 'maps'
local nvmap = maps.nvmap
local nmap = maps.nmap

local function setup_system_register()
  nvmap('+c', '"+c', '[C]ut (system register)')
  nvmap('+C', '"+C', '[C]ut (system register)')

  nvmap('+d', '"+d', '[D]elete (system register)')
  nvmap('+D', '"+D', '[D]elete (system register)')

  nvmap('+y', '"+y', '[Y]ank (system register)')
  nvmap('+Y', '"+Y', '[Y]ank (system register)')

  nvmap('+p', '"+p', '[P]aste (system register)')
  nvmap('+P', '"+P', '[P]aste (system register)')
end

local function setup_open()
  nmap('<leader>f', require('telescope.builtin').find_files, 'Open [F]iles')

  nmap('<leader>on', ':ObsidianSearch<cr>', '[O]pen [N]otes')
end

local function setup()
  vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
end

return {
  setup = setup,
  setup_open = setup_open,
  setup_system_register = setup_system_register
}
