local function nmap(lhs, rhs, desc)
  vim.keymap.set({ 'n' }, lhs, rhs, { desc = desc })
end

local function nvmap(lhs, rhs, desc)
  vim.keymap.set({ 'n', 'v' }, lhs, rhs, { desc = desc })
end

return {
  nmap = nmap,
  nvmap = nvmap
}

