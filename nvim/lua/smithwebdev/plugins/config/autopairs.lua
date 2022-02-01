local M = {}

M.plugin = {
  'windwp/nvim-autopairs', -- https://github.com/windwp/nvim-autopairs

  after = 'nvim-cmp',

  config = function()
    --local npairs = require('nvim-autopairs')
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

    --npairs.add_rules(require('nvim-autopairs.rules.endwise-elixir'))
    --npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
    --npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
  end
}

return M
