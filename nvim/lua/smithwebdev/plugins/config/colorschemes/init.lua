local M = {}

M.plugin = {
  'mrjones2014/lighthaus.nvim', -- https://github.com/mrjones2014/lighthaus.nvim
  'djjcast/mirodark', -- https://github.com/djjcast/mirodark

  config = function()
    require('lighthaus').setup({
      bg_dark = true
    })

    --require('mirodark').setup()

    --vim.cmd[[color lighthaus]]
    --vim.cmd[[color lighthaus_dark]]
    --vim.cmd([[set colorscheme mirodark]])
  end
}

return M
