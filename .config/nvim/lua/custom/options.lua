local function setup()
  vim.opt.scrolloff = 10
  vim.opt.startofline = true

  vim.opt.hlsearch = true
  vim.opt.mouse = 'a'

  vim.opt.breakindent = true

  vim.opt.undofile = true

  vim.opt.ignorecase = true
  vim.opt.smartcase = true

  vim.wo.signcolumn = 'yes'

  vim.opt.updatetime = 200
  vim.opt.timeoutlen = 300

  vim.opt.completeopt = 'menuone,noselect'

  vim.opt.termguicolors = true

  vim.opt.number = true
  vim.opt.relativenumber = true

  vim.opt.textwidth = 0
  vim.opt.wrapmargin = 0
  vim.opt.wrap = false

  vim.opt.conceallevel = 1

  vim.opt.tabstop = 4
  vim.opt.shiftwidth = 4

  vim.opt.swapfile = false
end

local function set_leader()
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
end

return {
  setup = setup,
  set_leader = set_leader
}
