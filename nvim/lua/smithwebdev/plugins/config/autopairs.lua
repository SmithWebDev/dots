local M = {}

M.plugin = {
  'windwp/nvim-autopairs', -- https://github.com/windwp/nvim-autopairs

  after = 'nvim-cmp',

  config = function()
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
  end
}

return M
