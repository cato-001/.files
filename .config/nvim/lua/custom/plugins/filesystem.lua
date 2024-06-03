local maps = require('maps')
local nmap = maps.nmap

local function open_parent_directory()
  local oil = require('oil')
  oil.open()
end

return {
  {
    'stevearc/oil.nvim',
    opts = {
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ['gd'] = 'actions.select',
        ['<Esc>'] = 'actions.close',
        ['<C-O>'] = 'actions.parent',
      },
      view_options = {
        show_hidden = true,
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      nmap('<leader>-', open_parent_directory, 'open parent directory')
    end
  },
}
