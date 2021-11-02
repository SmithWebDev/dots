local M = {}

M.plugin = {
  'b0o/mapx.nvim',

  -- Setup mapx.nvim settings AFTER the plugin (mapx.nvim) is loaded
  config = function()
    require'mapx'.setup ({
      global = true,
      whichkey = false
    })
  end
}

return M
