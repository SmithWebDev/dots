local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer = require('packer')
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

packer.init {
  compile_path = vim.fn.stdpath "data"
    .. "/site/pack/loader/start/packer.nvim/plugin/packer_compiled.lua",
  git = {
    clone_timeout = 300, -- 5 minutes, I have horrible internet
  },
  --display = {
  --  open_fn = function()
  --    return require("packer.util").float { border = Util.borders }
  --  end,
  --},
}

local plugins = {
  {"wbthomason/packer.nvim", opt = true },

  --Completion
  --====================================
  {"ms-jpq/coq_nvim"}
}

packer.startup(function(use)
  for _, v in pairs(plugins) do
    use(v)
  end 

end)
