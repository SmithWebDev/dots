local M = {}

M.plugin = {
  'mattn/emmet-vim',

  setup = function()
    -- emmet leader key
    vim.g.user_emmet_leader_key = ','
  end
}

return M
