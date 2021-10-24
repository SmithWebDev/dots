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

local M = {}

M.plugin = {
  'williamboman/nvim-lsp-installer', -- https://github.com/williamboman/nvim-lsp-installer

  after = 'mapx.nvim',

  config = function()
    local lsp_installer = require('nvim-lsp-installer')
    local lsp_installer_servers = require('nvim-lsp-installer.servers')

    lsp_installer.on_server_ready(function(server)
      local opts = {}

      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
    end)

    -- Smaller example(below) of the idea shared above

    --local ok, solargraph = lsp_installer_servers.get_server('solargraph')
    if ok then
      if not solargraph:is_installer() then
        solargraph:install()
      end
    end
  end
}

return M


    --local server_list = require('lua.smithwebdev.plugins.config.lsp.serverlist').server_list()
    --local ok, servers = lsp_installer_servers.get_server(''..v)
    --for _, v in pairs(server_list) do
      -- Create if statement that checks the filetype of the opened file
      -- and checks to see if the corresponding language server is installed.
      -- If server is not installed, proceeds to verify installation and perform
      -- process.
    --end

