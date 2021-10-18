local M = {}
--local m = require'mapx'.setup{ global = true }

M.plugin = {
  'ms-jpq/coq_nvim',
  'ms-jpq/coq.artifacts',
  --'m.setups-jpq/coq.thirdparty'
  config = function()
    require('config.coq').config()
    --config()
  end
}
M.config = function()
  --require'coq'.setup{
    vim.g.coq_settings = {
      auto_start = 'shut-up',
      keymap = {
        recommended = false,
        --jump_to_mark = '<c-space>'
      },
    --}
  
  --keybindings
  --inoremap('<Esc>', [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]])
  --inoremap('<C-c>', [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]])
  --inoremap('<BS>', [[pumvisible() ? "\<C-e><BS>"  : "\<BS>"]])
  --inoremap('jj', [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "jj"]])
  --inoremap('<c-j>', [[pumvisible() ? "\<C-n>" : "\<c-j>"]], 'silent', 'expr')
  --inoremap('<c-k>', [[pumvisible() ? "\<C-p>" : "\<c-k>"]], 'silent', 'expr')
  print('coq settings loaded')
}
end

--local vim.g.coq_settings = {
--    'auto_start': 'shut-up',
--    'keymap': {
--      'recommended': 'false',
--      'jump_to_mark': '<c-CR>'
--    }
--  }

return M
