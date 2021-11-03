local theme = 'gloombuddy'
local ok, err = pcall(vim.cmd, 'colorscheme '.. theme)
if not ok then
  vim.cmd('colorscheme default')
end
