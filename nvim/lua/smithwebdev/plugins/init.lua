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
  'animate',             -- https://github.com/camspiers/animate.vim
  'colorschemes',
  'indent_blankline',    -- https://github.com/lukas-reineke/indent-blankline.nvim
  'shade',               -- https://github.com/sunjon/shade.nvim
  'statusline',          -- https://github.com/beauwilliams/statusline.lua
  'vim_smoothie',        -- https://github.com/psliwka/vim-smoothie

  -- Completion
  --'coq',                 -- https://github.com/ms-jpq/coq_nvim  **
  'cmp',                 -- https://github.com/hrsh7th/nvim-cmp
  'emmet',               -- https://github.com/mattn/emmet-vim
  --'tags',                  -- https://github.com/ludovicchabant/vim-gutentags  **

  -- Editing
  'colorizer',           -- https://github.com/norcalli/nvim-colorizer.lua
  'comment',             -- https://github.com/numToStr/Comment.nvim
  'easy_align',          -- https://github.com/junegunn/vim-easy-align
  'folds',               -- https://github.com/anuvyklack/pretty-fold.nvim
  'hlslens',             -- https://github.com/kevinhwang91/nvim-hlslens
  --'lualine',             -- https://github.com/hoob3rt/lualine.nvim
  'marks',               -- https://github.com/chentau/marks.nvim
  'peekabo', -- https://github.com/junegunn/vim-peekaboo
  'surround',            -- https://github.com/tpope/vim-surround
  --'speeddating',         -- https://github.com/tpope/vim-speeddating
  --'heroku',              -- https://github.com/tpope/vim-heroku

  -- Filetypes
  --'dash',                -- https://github.com/mrjones2014/dash.nvim  **
  --'haml',                -- https://github.com/tpope/vim-haml
  'markdown_preview',    -- https://github.com/iamcco/markdown-preview.nvim
  'rails',               -- https://github.com/tpope/vim-rails  **
  'seeing_is_believing', -- https://github.com/JoshCheek/seeing_is_believing
  'sniprun', --  https://github.com/michaelb/sniprun

  -- Fuzzy / File Finder
  'fzy',                 -- https://github.com/mfussenegger/nvim-fzy  **
  'telescope',           -- https://github.com/nvim-telescope/telescope.nvim  **

  -- Git
  'lazygit',             -- https://github.com/kdheepak/lazygit.nvim **

  -- Keybinds
  'mapx',                -- https://github.com/b0o/mapx.nvim
  'whichkey',            -- https://github.com/folke/which-key.nvim

  -- LSP & File Navigation
  'CHADtree',            -- https://github.com/ms-jpq/chadtree
  'harpoon',             -- https://github.com/ThePrimeagen/harpoon
  'navigator',           -- https://github.com/ray-x/navigator.lua  **

  -- Organization Utilities
  ----'orgmode',               -- https://github.com/kristijanhusak/orgmode.nvim

  -- Snippets
  'ultisnips',           -- https://github.com/SirVer/ultisnips

  -- Terminal Emulator
  'terminal', -- https://github.com/jlesquembre/nterm.nvim
  -- Testing
  'ultest',              -- https://github.com/rcarriga/vim-ultest  **

  -- Treesitter/Syntax Highlighting
  --'playground',            -- https://github.com/nvim-treesitter/playground  **
  'treesitter',          -- https://github.com/nvim-treesitter/nvim-treesitter
}

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  for _, v in pairs(plugins) do
    use(require('smithwebdev.plugins.config.'..v).plugin)
  end
end)

--test
print('Plugins connected...')
