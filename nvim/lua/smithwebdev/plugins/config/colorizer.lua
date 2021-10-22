local M = {}

M.plugin = {
  'norcalli/nvim-colorizer.lua',

  after = 'mapx.nvim',

  setup = function()
    default_options = {
      rgb      = true, -- #RGB hex codes
      rrggbb   = true, -- #RRGGBB hex codes
      names    = true, -- "Name" codes like Blue
      rrggbbaa = true, -- #RRGGBBAA hex codes
      rgb_fn   = true, -- CSS rgb() and rgba() functions
      hsl_fn   = true, -- CSS hsl() and hsla() functions
      css      = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn   = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      },
  end,
}

return M
