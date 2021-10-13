local M = {}

M.plugin = {
  'ms-jpq/coq_nvim',
  config = function()
    require('plugins.coq').config()
  end
}

M.config = function()
  require('coq').setup
end

return M
