local M = {}

-- Embedded Ruby Custom Surround Triggers
-- #
vim.g.surround_35='<%# \r %>'

-- -
vim.g.surround_45='<% \r %>'

-- =
vim.g.surround_61='<%= \r %>'

-- b
vim.g.surround_98='<% \r %>\n<% end %>'

M.plugin = {
  'tpope/vim-surround',

}

return M
