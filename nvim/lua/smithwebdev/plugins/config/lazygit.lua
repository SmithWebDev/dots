local M = {}

M.plugin = {
  'kdheepak/lazygit.nvim',

  after = 'mapx.nvim',

  config = function()
    -- keybindings
    nnoremap('<leader>gl', '<cmd>LazyGit<CR>')
  end
}

return M
