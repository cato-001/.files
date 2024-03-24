local function setup()
  vim.o.scrolloff = 10
  vim.o.startofline = true

  vim.o.hlsearch = true
  vim.o.mouse = 'a'

  vim.o.breakindent = true

  vim.o.undofile = true

  vim.o.ignorecase = true
  vim.o.smartcase = true

  vim.wo.signcolumn = 'yes'

  vim.o.updatetime = 200
  vim.o.timeoutlen = 300

  vim.o.completeopt = 'menuone,noselect'

  vim.o.termguicolors = true

  vim.o.number = true
  vim.o.relativenumber = true

  vim.o.textwidth = 0
  vim.o.wrapmargin = 0
  vim.o.wrap = false

  vim.o.conceallevel = 1

  vim.opt.tabstop = 4
  vim.opt.shiftwidth = 4
end

local function set_leader()
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
end

return {
  setup = setup,
  set_leader = set_leader
}
