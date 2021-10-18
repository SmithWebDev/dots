local M = {}

M.plugin = {
  'b0o/mapx.nvim',
  --config = function()
  --  require('config.mapx').config()
  --end
}

M.config = function()
    require'mapx'.setup {
      global = true,
      whichkey = false
    }
end

return M
