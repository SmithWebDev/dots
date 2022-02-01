local M = {}

M.plugin = {
  'ThePrimeagen/harpoon',

  after = {
    'mapx.nvim'
  },

  config = function()
    --keybindings
    nnoremap('<leader>hm', ':lua require("harpoon.mark").add_file()<CR>') --, Mark Files to revisit later
    nnoremap('<leader>hq', ':lua require("harpoon.ui").toggle_quick_menu()<CR>') --, View all project marks
    nnoremap('<leader>hj', ':lua require("harpoon.ui").nav_next()<CR>') --, Navigates to next mark
    nnoremap('<leader>hk', ':lua require("harpoon.ui").nav_prev()<CR>') --, Navigates to previous mark
  end
}

return M
