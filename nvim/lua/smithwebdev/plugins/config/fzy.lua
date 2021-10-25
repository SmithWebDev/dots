local M = {}

M.plugin = {
  'mfussenegger/nvim-fzy',

  after = 'mapx.nvim',

  config = function()
    local fzy = require('fzy')

    --nnoremap('<leader>fc', [[:lua require('fzy').execute('fd', require('fzy').sinks.edit_file)<CR>]])
    --nnoremap('<leader>fb', [[:lua require('fzy').actions.buffers<CR>]])
    --nnoremap('<leader>ft', [[:lua require('fzy').try(fzy.actions.lsp_tags, require('fzy').actions.buf_tags<CR>]])
    --nnoremap('<leader>f', [[:lua require('fzy').execute('git ls-files', fzy.sinks.edit_file)<CR>]])
    --nnoremap('<leader>fq', [[:lua require('fzy').actions.quickfix()<CR>]])
    --nnoremap('<leader>f', [[:lua require('fzy').actions.buf_lines()<CR>]])
    end
}

return M
