local M = {}

M.plugin = {
  'nvim-treesitter/playground', --https://github.com/nvim-treesitter/playground

  after = 'mapx.nvim',

  config = function()
    -- keybindings
    nnoremap('<leader><leader>tsp', ':TSPlaygroundToggle<CR>')
  end
}

return M
