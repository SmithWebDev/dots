local M = {}

M.plugin = {
  'mrjones2014/dash.nvim',

  requires = { 'nvim-telescope/telescope.nvim' },

  run = 'make install',

  disable = not vim.fn.has('macunix'),

  after = 'mapx.nvim',

  config = function()
    -- keybindings
    nnoremap('<leader>fd',':Dash<Space>') --, 'Open Dash Query'
    nnoremap('<leader>fdw','<cmd>DashWord<CR>') --, 'Open Dash Query Under Cursor'
  end,
}

return M
