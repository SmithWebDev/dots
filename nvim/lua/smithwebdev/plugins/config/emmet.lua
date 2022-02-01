local M = {}

vim.g.user_emmet_leader_key = ','
vim.g.user_emmet_settings = {
  jsx = {
    attribute = {
      {['for'] = 'htmlFor'},
      {class = 'className'}
      },
    ['javascript.jsx'] = {
      {extends = 'jsx'}
        },
    -- ['erb'] = {
    --   {extends = 'html'}
    --   },
    }
  }

vim.g.user_emmet_mode = 'inv'

M.plugin = {
  'mattn/emmet-vim',
}

return M
