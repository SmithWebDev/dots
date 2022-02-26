local M = {}

M.plugin = {
  'nvim-treesitter/nvim-treesitter',
  --'nvim-treesitter/nvim-treesitter-refactor',
  'RRethy/nvim-treesitter-textsubjects',
  'RRethy/nvim-treesitter-endwise',
  'nvim-treesitter/playground', --https://github.com/nvim-treesitter/playground

  -- Run this command after the plugin (nvim-treesitter) is loaded
  run = ':TSUpdate',

  after = 'mapx.nvim',

  -- Setup nvim-treesitter settings AFTER the plugin (nvim-treesitter) is loaded
  config = function()
    require'nvim-treesitter.configs'.setup {
      -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      --refactor = {
      --  highlight_definitions = { enable = true },
      --  highlight_current_scope = { enable = true },
      --  smart_rename = {
      --    enable = true, 
      --    keymaps = {
      --      smart_rename = "grr",
      --      },
      --    },
      --  },
      --  navigation = {
      --    enable = true,
      --    keymaps = {
      --      gotodefinition = "gnd",
      --      list_definitions = "gnD",
      --      list_definitions_toc = "g0",
      --      goto_next_usage = "gnu",
      --      goto_previous_usage = "gpu",
      --    }
      --  },
      ensure_installed = {
        'lua',
        --'ruby',
        'html',
        'css',
        'javascript',
        'go',
        'query',
        --'org',
      },
      highlight = {
        enable = true, -- false will disable the whole extension
      },
      indent = {
        enable = true,
      },
      endwise = {
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

    -- keybindings
    --nnoremap('<leader><leader>tsp', ':TSPlaygroundToggle<CR>')
  end
}

return M
