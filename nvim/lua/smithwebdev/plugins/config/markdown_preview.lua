local M = {}

vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_page_title = '[${name}]'

M.plugin = {
  'iamcco/markdown-preview.nvim',

  run = 'cd app && npm install',

  after= 'mapx.nvim',

  config = function()
    --keybindings
    nnoremap('<leader><leader>mm', ':MarkdownPreviewToggle<cr>')
    nnoremap('<leader><leader>mo', ':MarkdownPreview<cr>')
    nnoremap('<leader><leader>ms', ':MarkdownPreviewStop<cr>')
  end
}

return M
