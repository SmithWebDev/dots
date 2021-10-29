local M = {}

M.plugin = {
  'kristijanhusak/orgmode.nvim',

  ft = 'org',

  config = function()
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
