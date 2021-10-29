local M = {}

M.plugin = {
  'ludovicchabant/vim-gutentags',

  after = 'mapx.nvim',

  config = function()
    --keybindings
    nnoremap('<leader><leader>ga', '<cmd>GutentagsUpdate!<CR>') --,       'Update Project Tags'
    nnoremap('<leader><leader>gr', '<cmd>GutentagsToggleTrace<CR>') --,   'Toggle Gutentags Show Trace'
    nnoremap('<leader><leader>gt', '<cmd>GutentagsToggleEnabled<CR>') --, 'Toggle Gutentags'
    nnoremap('<leader><leader>gu', '<cmd>GutentagsUpdate<CR>') --,        'Update Tags from Current File'
  end
}

return M
