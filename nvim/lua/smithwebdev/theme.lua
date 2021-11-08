local theme = 'mirodark'
local ok, err = pcall(vim.cmd, 'colorscheme '.. theme)
if not ok then
  vim.cmd('colorscheme default')
  else
  print "Theme Loaded"
end
