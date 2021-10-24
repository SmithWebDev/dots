local M = {}

M.plugin = {
  'ray-x/navigator.lua',
  'williamboman/nvim-lsp-installer', -- https://github.com/williamboman/nvim-lsp-installer
  'neovim/nvim-lspconfig',

  after = {
    'mapx.nvim',
    'nvim-treesitter',
    },

  -- This plugin requires that the following plugins be loaded BEFORE navigator.lua
  requires = {
    'neovim/nvim-lspconfig',
    { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
  },

  -- Setup navigator.lua settings AFTER the plugin (navigator.lua) is loaded
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    require'navigator'.setup({
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.cmd [[
            augroup lsp_buf_format
              au! BufWritePost <buffer> :lua vim.lsp.buf.formatting_sync()
            augroup END
          ]]
        end
        print(client.name .. ' is now attached.')
      end,

      lsp_installer = true,
    })

    local lsp_installer = require('nvim-lsp-installer')
    local lsp_installer_servers = require('nvim-lsp-installer.servers')

    lsp_installer.on_server_ready(function(server)
      local opts = {}

      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
    end)
  end,
}

return M
