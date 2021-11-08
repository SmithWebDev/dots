local M = {}

--vim.g.UltiSnipsRemoveSelectModeMappings = 0
vim.g.UltiSnipsEditSplit = "context"
vim.g.UltiSnipsEnableSnipMate = 1
vim.g.UltiSnipsExpandTrigger               = "<tab>"
vim.g.UltiSnipsListSnippets                = "<c-tab>"
--vim.g.UltiSnipsJumpForwardTrigger          = "<c-j>"
--vim.g.UltiSnipsJumpBackwardTrigger         = "<c-k>"
--vim.g.UltiSnipsDirectories = {}

M.plugin = {
  'SirVer/ultisnips',

  requires = {
    'honza/vim-snippets',
    },


  --keybinds
  
}

return M
