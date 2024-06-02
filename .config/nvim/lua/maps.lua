local function map(modes, lhs, rhs, desc, opts)
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

local function nmap(lhs, rhs, desc, opts)
  map('n', lhs, rhs, desc, opts)
end

local function nvmap(lhs, rhs, desc, opts)
  map({ 'n', 'v' }, lhs, rhs, desc, opts)
end

local function imap(lhs, rhs, desc, opts)
  map('i', lhs, rhs, desc, opts)
end

local function feedkeys(text, mode)
  text = vim.api.nvim_replace_termcodes(text, true, true, true)
  vim.api.nvim_feedkeys(text, mode, true)
end

local function nfeedkeys(text)
  feedkeys(text, 'n')
end

return {
  nmap = nmap,
  nvmap = nvmap,
  imap = imap,
  nfeedkeys = nfeedkeys,
}
