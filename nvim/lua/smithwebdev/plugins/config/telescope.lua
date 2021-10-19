local M = {}

M.plugin = {
  'nvim-telescope/telescope.nvim',

  -- This plugin requires that the following plugins be loaded BEFORE telescope.nvim
  requires = 'nvim-lua/plenary.nvim',

  -- Make sure this plugin (telescope.nvim) is loaded AFTER mapx is loaded
  after = 'mapx.nvim',

  -- Setup telescope.nvim settings AFTER the plugin (telescope.nvim) is loaded
  config = function()
    local telescope = require('telescope')
    local telescope_builtin = require('telescope.builtin')

    telescope.setup({
      defaults = {
        layout_config = { prompt_position = 'top' },
        layout_strategy = 'horizontal',
        sorting_strategy = 'ascending',
        use_less = false,
      },
    })

    function _G.TelescopeFindFiles()
      telescope_builtin.find_files({
        find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
        previewer = false,
      })
    end

    function _G.TelescopeLiveGrep()
      telescope_builtin.live_grep({})
    end

    function _G.TelescopeFindConfigFiles()
      local configdir = vim.fn.stdpath('config')
      telescope_builtin.find_files({
        find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden', configdir },
        previewer = false,
      })
    end

    nnoremap('<C-p>', [[<Cmd>lua TelescopeFindFiles()<CR>]])
    nnoremap('<C-t>', [[<Cmd>lua TelescopeLiveGrep()<CR>]])
  end,
}

return M
