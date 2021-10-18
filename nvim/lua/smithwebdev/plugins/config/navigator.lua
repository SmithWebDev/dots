local M = {}

M.plugin = {
  'ray-x/navigator.lua',

  -- This plugin requires that the following plugins be loaded BEFORE navigator.lua
  requires = {
    'neovim/nvim-lspconfig',
    { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
  },

  -- Setup navigator.lua settings AFTER the plugin (navigator.lua) is loaded
  config = function()
    require'navigator'.setup()
  end,
}

return M
