local M = {}

M.plugin = {
  'nvim-treesitter/nvim-treesitter',

  -- Run this command after the plugin (nvim-treesitter) is loaded
  run = ':TSUpdate',

  -- Setup nvim-treesitter settings AFTER the plugin (nvim-treesitter) is loaded
  config = function()
    require'nvim-treesitter.configs'.setup {
      -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      ensure_installed = {
        'lua',
        'ruby',
        'html',
        'css',
        'javascript',
        'go',
      },
      highlight = {
        enable = true, -- false will disable the whole extension
      },
      indent = {
        enable = true,
      },
    }
  end,
}

return M
