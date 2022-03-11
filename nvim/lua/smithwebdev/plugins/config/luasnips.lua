local M = {}

M.plugin = {
  'L3MON4D3/LuaSnip',

  after = 'nvim-cmp',

  config = function()
    require('smithwebdev.snippets')
  end
}

return M
