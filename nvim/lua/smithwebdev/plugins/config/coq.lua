local M = {}

M.plugin = {
  'ms-jpq/coq_nvim',

  -- This plugin requires that the following plugins be loaded BEFORE coq_nvim
  requires = {
    'ms-jpq/coq.artifacts',
    -- 'ms-jpq/coq.thirdparty',
  },

  -- Make sure this plugin (coq_nvim) is loaded AFTER mapx is loaded
  after = 'mapx.nvim',

  -- Setup coq_nvim settings BEFORE the plugin (coq_nvim) is loaded
  setup = function()
    vim.g.coq_settings = {
      auto_start = true,
      keymap = {
        recommended = false,
        jump_to_mark = '<c-space>',
      },
    }
  end,

  -- Setup coq_nvim settings AFTER the plugin (coq_nvim) is loaded
  config = function()
    -- keybindings
    inoremap('<Esc>', [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], 'silent', 'expr')
    inoremap('<C-c>', [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]], 'silent', 'expr')
    inoremap('<BS>', [[pumvisible() ? "\<C-e><BS>"  : "\<BS>"]], 'silent', 'expr')
    inoremap('jj', [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "jj"]], 'silent', 'expr')
    inoremap('<c-j>', [[pumvisible() ? "\<C-n>" : "\<c-j>"]], 'silent', 'expr')
    inoremap('<c-k>', [[pumvisible() ? "\<C-p>" : "\<c-k>"]], 'silent', 'expr')
  end
}

return M
