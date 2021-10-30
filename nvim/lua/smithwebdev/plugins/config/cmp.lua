local M = {}

M.plugin = {
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lua', -- https://github.com/hrsh7th/cmp-nvim-lua

  requires = {
  },

  config = function()
    local remap = vim.api.nvim_set_keymap
    local cmp = require('cmp')

    cmp.setup({
      completion = {
        sutocomplete = false,
        },
        documentation = {
          border = "solid",
        },
      mapping = {
        ['Tab'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end
      },
      sources = {
      }
    })

    remap(
      "i",
      "<CR>",
      "v:lua.smithwebdev.core.Utilities.trigger_completion()",
      {noremap = true, expr = true}
    )
    end
}

return M

