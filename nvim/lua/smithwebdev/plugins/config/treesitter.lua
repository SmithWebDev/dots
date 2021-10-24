local M = {}

M.plugin = {
  'nvim-treesitter/nvim-treesitter',

  -- Run this command after the plugin (nvim-treesitter) is loaded
  run = ':TSUpdate',

  after = 'mapx.nvim',

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
        'query', },
      highlight = {
        enable = true, -- false will disable the whole extension
      },
      indent = {
        enable = true,
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',},
        }
      }
  end,
}

return M
