local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

local packer = require'packer'

local plugins = {
  --{"wbthomason/packer.nvim", opt = true },
  {"coq"}
}

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  for _, v in pairs(plugins) do
    require('plugins.'..v).plugin
  end
end)
