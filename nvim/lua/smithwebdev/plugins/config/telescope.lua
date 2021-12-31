local M = {}

M.plugin = {
  'nvim-telescope/telescope.nvim',

  -- This plugin requires that the following plugins be loaded BEFORE telescope.nvim
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-media-files.nvim',
    'nvim-telescope/telescope-frecency.nvim',
    'nvim-telescope/telescope-fzy-native.nvim',
    'fhill2/telescope-ultisnips.nvim'
    },

  -- Make sure this plugin (telescope.nvim) is loaded AFTER mapx is loaded
  after = 'mapx.nvim',

  -- Setup telescope.nvim settings AFTER the plugin (telescope.nvim) is loaded
  config = function()
    local telescope = require('telescope')
    local telescope_builtin = require('telescope.builtin')
    local telescope_actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        layout_config = { prompt_position = 'top' },
        layout_strategy = 'flex',
        sorting_strategy = 'ascending',
        use_less = false,
      },

      extensions = {
        --fzy_native = {
        --  override_generic_sorter = false,
        --  override_file_sorter = true,
        --},
        dash = {
        },
      },
    })

    telescope.load_extension('ultisnips')

    function _G.TelescopeFindConfigFiles()
      local configdir = vim.fn.stdpath('config')
      telescope_builtin.find_files({
        find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden', configdir },
        previewer = false,
      })
    end

    function _G.TelescopeFindFiles()
      telescope_builtin.find_files({
        find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
        previewer = false,
      })
    end

    function _G.TelescopeFileBrowser()
      telescope_builtin.file_browser({
      })
    end

    function _G.TelescopeLiveGrep()
      telescope_builtin.live_grep({})
    end

    function _G.TelescopeKeyMap()
      telescope_builtin.keymaps({})
    end

    function _G.TelescopeQuickFix()
      telescope_builtin.quickfix({
        mappings = {
          i = {
            ["<C-q>"] = telescope_actions.send_to_qflist
          },
        },
      })
    end

    nnoremap('<leader>fc', [[<Cmd>lua TelescopeFindConfigFiles()<CR>]])
    nnoremap('<leader>ff', [[<Cmd>lua TelescopeFindFiles()<CR>]])
    --nnoremap('<leader>fb', [[<Cmd>lua TelescopeFindFiles()<CR>]])
    --nnoremap('<leader>ff', [[<Cmd>lua TelescopeFindFiles()<CR>]])
    nnoremap('<leader>fl', [[<Cmd>lua TelescopeLiveGrep()<CR>]])
    nnoremap('<leader>fm', [[<Cmd>lua TelescopeKeyMap()<CR>]])
    nnoremap('<leader>fq', [[<Cmd>lua TelescopeQuickFix()<CR>]])
  end,
}

return M
