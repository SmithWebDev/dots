local M = {}

M.plugin = {
  "mattn/emmet-vim",
  setup = function()
    require('config.emmet').config()
  end
}

M.config = function ()
  require'emmet'.config{
    user_emmet_leader_key = ','
  }
end

return M
