local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

local packer = require'packer'

-- Use your local data path and not plugin/
-- this is `~/.local/share/nvim/packer_compiled.lua` in WSL/Linux and MacOS
packer.init {
  compile_path = vim.fn.stdpath('data') .. '/site/plugin/packer_compiled.lua'
}

local plugins = {
  -- Keybinds
  "mapx", -- https://github.com/b0o/mapx.nvim

  -- Completion
  "coq",  -- https://github.com/ms-jpq/coq_nvim
  "emmet",
}

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  for _, v in pairs(plugins) do
    use(require('smithwebdev.plugins.config.'..v).plugin)
  end
end)
