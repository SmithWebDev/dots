local M = {}

M.plugin = {
  'kristijanhusak/orgmode.nvim',

  ft = 'org',

  after = 'nvim-treesitter',

  config = function()
    local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
    parser_config.org = {
      install_info = {
        url = 'https://github.com/milisims/tree-sitter-org',
        revision = 'main',
        files = {'src/parser.c', 'src/scanner.cc'},
      },
      filetype = 'org',
    }
    require('orgmode').setup({
      mappings = {
        global = {
          org_agenda = 'gA',
          org_capture = 'gC'
        },
      },
    })
  end
}

return M
