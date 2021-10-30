local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end


local packer = require'packer'

-- Use your local data path and not plugin/
-- this is `~/.local/share/nvim/site/plugin/packer_compiled.lua` in WSL/Linux and MacOS
packer.init {
  compile_path = vim.fn.stdpath('data') .. '/site/plugin/packer_compiled.lua'
}

local plugins = {
  -- Aesthetics
  --'colorschemes',

  -- Completion
  --'coq',                 -- https://github.com/ms-jpq/coq_nvim
  'cmp', -- https://github.com/hrsh7th/nvim-cmp
  'emmet',               -- https://github.com/mattn/emmet-vim
  'tags',                -- https://github.com/ludovicchabant/vim-gutentags

  -- Editing
  'colorizer',           -- https://github.com/norcalli/nvim-colorizer.lua
  'easy_align',          -- https://github.com/junegunn/vim-easy-align
  'marks',               -- https://github.com/chentau/marks.nvim
  'surround',            -- https://github.com/tpope/vim-surround
  --'speeddating',       -- https://github.com/tpope/vim-speeddating
  --'heroku',            -- https://github.com/tpope/vim-heroku

  -- Filetypes
  'dash',                -- https://github.com/mrjones2014/dash.nvim
  --'haml',              -- https://github.com/tpope/vim-haml
  'rails',               -- https://github.com/tpope/vim-rails
  'seeing_is_believing', -- https://github.com/JoshCheek/seeing_is_believing

  -- Fuzzy / File Finder
  'fzy',                 -- https://github.com/mfussenegger/nvim-fzy
  'telescope',           -- https://github.com/nvim-telescope/telescope.nvim

  -- Git
  'lazygit',             -- https://github.com/kdheepak/lazygit.nvim

  ---- Keybinds
  'mapx',                -- https://github.com/b0o/mapx.nvim
  'whichkey',            --

  -- LSP & Navigator
  'navigator',           -- https://github.com/ray-x/navigator.lua

  -- Organization Utilities
  'orgmode',             -- https://github.com/kristijanhusak/orgmode.nvim

  -- Testing
  'ultest',              -- https://github.com/rcarriga/vim-ultest

  -- Treesitter/Syntax Highlighting
  'playground',          -- https://github.com/nvim-treesitter/playground
  'treesitter',          -- https://github.com/nvim-treesitter/nvim-treesitter
}

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  for _, v in pairs(plugins) do
    use(require('smithwebdev.plugins.config.'..v).plugin)
  end
end)

print('Plugins connected...')
