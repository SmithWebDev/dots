local on_attach = function(client, bufnr) 
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
  print(client.name .. ' is now attached.')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

--local M = {}
--
--M.plugin = {
--  'williamboman/nvim-lsp-installer', -- https://github.com/williamboman/nvim-lsp-installer
--
--  after = 'mapx.nvim',
--
--  config = function()
--    local lsp_installer = require('nvim-lsp-installer')
--
--    lsp_installer.on_server_ready(function(server)
--      local opts = {}
--
--      server:setup(opts)
--      vim.cmd [[ do User LspAttachBuffers ]]
--    end)
--
--
--  end,
--}
--
--return M
