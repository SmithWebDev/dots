local M = {}

M.plugin = {
  'nvim-treesitter/playground', --https://github.com/nvim-treesitter/playground

  run = ':TSInstall query',
  
  after = 'mapx.nvim',

  config = function()
    -- keybindings
    nnoremap('<leader><leader>ts', ':TSPlaygroundToggle<CR>')
  end
}

return M
