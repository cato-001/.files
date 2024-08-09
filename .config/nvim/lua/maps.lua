local M = {}

M.map = function(modes, lhs, rhs, desc, opts)
  if modes == nil then
    return
  end
  if type(modes) == "string" then
    modes = { modes }
  end
  if opts == nil then
    opts = {}
  end
  opts.desc = desc
  vim.keymap.set(modes, lhs, rhs, opts)
end

M.nmap = function(lhs, rhs, desc, opts)
  M.map('n', lhs, rhs, desc, opts)
end

M.vmap = function(lhs, rhs, desc, opts)
  M.map('v', lhs, rhs, desc, opts)
end

M.nvmap = function(lhs, rhs, desc, opts)
  M.map({ 'n', 'v' }, lhs, rhs, desc, opts)
end

M.imap = function(lhs, rhs, desc, opts)
  M.map('i', lhs, rhs, desc, opts)
end

local function feedkeys(text, mode)
  text = vim.api.nvim_replace_termcodes(text, true, true, true)
  vim.api.nvim_feedkeys(text, mode, true)
end

M.nfeedkeys = function(text)
  feedkeys(text, 'n')
end

return M
