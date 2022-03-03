local M = {}

M.plugin = {
  'jlesquembre/nterm.nvim',

  requires = {
    'Olical/aniseed',
  },
  after = 'mapx.nvim',

  config = function()
    local nterm = require('nterm.main')
    require'nterm.main'.init({
      maps = false,
      shell = 'zsh',
      size = 40,
      direction = 'vertical',
      popup = 5000,
      popup_pos = "SE",
      autoclose = 2000,
    })


    --keybindings

    nnoremap('<leader>nt',          ":lua require'nterm.main'.term_toggle()<CR>") --,        Toggle Nterm

    -- Rails commands
    --nnoremap('<leader><leader>rbi',          ":lua require'nterm.main'.term_send('bundle install')<CR>") --,        Bundle Install Command
    --nnoremap('<leader><leader>rbu',          ":lua require'nterm.main'.term_send('bundle update')<CR>") --,         Bundle Update Command
  end

}

return M
