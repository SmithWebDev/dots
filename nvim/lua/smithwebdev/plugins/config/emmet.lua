local M = {}

M.plugin = {
  'mattn/emmet-vim',

  setup = function()
    -- There is no setup() function for emmet-vim
    -- use `vim.g` wherever you see `let g:`
    -- in the emmet-vim repo
    vim.g.user_emmet_leader_key = ','
  end
}

return M
