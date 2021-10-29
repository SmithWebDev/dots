local M = {}

M.plugin = {
  'folke/which-key.nvim',

  config = function()
    require('which-key').setup({
      plugins = {
        marks = true, 
        registers = true, 
        spelling = {
          enabled = false,
          suggestions = 20,
          },
        presets = {
          operators = true,
          motions = false,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true
          },
      },
    })
  end
}

return M
