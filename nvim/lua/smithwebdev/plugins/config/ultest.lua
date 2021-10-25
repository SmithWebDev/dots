local M = {}

M.plugin = {
  'rcarriga/vim-ultest',

  requires = {
    'vim-test/vim-test'
    },

  run = ':UpdateRemotePlugins',

  after = 'mapx.nvim',

  config = function()
    -- keybindings
    nnoremap('<leader>ua', '<cmd>UltestAttach<CR>') --,  'Attach Live Debugging'
    nnoremap('<leader>uj', '<cmd>UltestNearest<CR>') --, 'Run Nearest Test Current'
    nnoremap('<leader>ur', '<cmd>Ultest<CR>') --,        'Run All Test Current File'
    nnoremap('<leader>us', '<cmd>UltestSummary<CR>') --, 'Toggle Summary Window'
    nnoremap('<leader>ux', '<cmd>UltestStop<CR>') --,    'Stop Running Tests'
  end
}

return M
