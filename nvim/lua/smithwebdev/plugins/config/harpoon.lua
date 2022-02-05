local M = {}

M.plugin = {
  'ThePrimeagen/harpoon',

  after = {
    'mapx.nvim',
    'telescope.nvim',
  },

  config = function()
    require('telescope').load_extension('harpoon')
    --keybindings

    nnoremap('<leader>fj', ':Telescope harpoon marks<CR>')
    nnoremap('<leader>jf', ':lua require("harpoon.mark").add_file()<CR>') --, Mark Files to revisit later
    nnoremap('<leader>jj', ':lua require("harpoon.ui").nav_next()<CR>') --, Navigates to next mark
    nnoremap('<leader>jk', ':lua require("harpoon.ui").nav_prev()<CR>') --, Navigates to previous mark
    nnoremap('<leader>jm', ':lua require("harpoon.ui").toggle_quick_menu()<CR>') --, View all project marks
  end
}

return M
