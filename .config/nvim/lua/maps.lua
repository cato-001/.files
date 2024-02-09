local function nmap(lhs, rhs, desc, opts)
  if opts == nil then
    opts = {}
  end
  opts.desc = desc
  vim.keymap.set({ 'n' }, lhs, rhs, opts)
end

local function nvmap(lhs, rhs, desc, opts)
  if opts == nil then
    opts = {}
  end
  opts.desc = desc
  vim.keymap.set({ 'n', 'v' }, lhs, rhs, opts)
end

return {
  nmap = nmap,
  nvmap = nvmap
}
