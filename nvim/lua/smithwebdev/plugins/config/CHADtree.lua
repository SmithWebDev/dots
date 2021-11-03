local M = {}

M.plugin = {
  'ms-jpq/chadtree',

  branch = 'chad',

  after = {
    'mapx.nvim',
    'nvim-treesitter',
    },

  config = function()
  --keybinds
    nnoremap('<leader><leader>e', ':CHADopen<CR>')
  end
}

return M
