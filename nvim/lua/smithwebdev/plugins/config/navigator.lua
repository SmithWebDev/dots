local M = {}

M.plugin = {
  'ray-x/navigator.lua',

  after = {
    'mapx.nvim',
    'nvim-treesitter',
    },

  -- This plugin requires that the following plugins be loaded BEFORE navigator.lua
  requires = {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer', -- https://github.com/williamboman/nvim-lsp-installer
    { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
  },

  -- Setup navigator.lua settings AFTER the plugin (navigator.lua) is loaded
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true,

    require('navigator').setup({
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
      default_mapping = false,
      keymaps = {
        --{key  = "gr",            func = "require('navigator.reference').reference()"},
        --{mode = "i",             key  = "<M-k>", func = "signature_help()"},
        --{key  = "<c-k>",         func = "signature_help()"},
        --{key  = "g0",            func = "require('navigator.symbols').document_symbols()"},
        --{key  = "gW",            func = "workspace_symbol()"},
        --{key  = "<c-]>",         func = "require('navigator.definition').definition()"},
        --{key  = "gD",            func = "declaration({ border = 'rounded', max_width = 80 })"},
        --{key  = "gp",            func = "require('navigator.definition').definition_preview()"},
        --{key  = "gT",            func = "require('navigator.treesitter').buf_ts()"},
        --{key  = "<Leader>gT",    func = "require('navigator.treesitter').bufs_ts()"},
        --{key  = "K",             func = "hover({ popup_opts = { border = single, max_width = 80 }})"},
        --{key  = "<Space>ca",     mode = "n", func = "require('navigator.codeAction').code_action()"},
        --{key  = "<Space>cA",     mode = "v", func = "range_code_action()"},
        --{key  = "<Leader>re",    func = "rename()"},
        --{key  = "<Space>rn",     func = "require('navigator.rename').rename()"},
        --{key  = "<Leader>gi",    func = "incoming_calls()"},
        --{key  = "<Leader>go",    func = "outgoing_calls()"},
        --{key  = "gi",            func = "implementation()"},
        --{key  = "<Space>D",      func = "type_definition()"},
        --{key  = "gL",            func = "require('navigator.diagnostics').show_diagnostics()"},
        --{key  = "gG",            func = "require('navigator.diagnostics').show_buf_diagnostics()"},
        --{key  = "]d",            func = "diagnostic.goto_next({ border = 'rounded', max_width = 80})"},
        --{key  = "[d",            func = "diagnostic.goto_prev({ border = 'rounded', max_width = 80})"},
        --{key  = "]r",            func = "require('navigator.treesitter').goto_next_usage()"},
        --{key  = "[r",            func = "require('navigator.treesitter').goto_previous_usage()"},
        --{key  = "<C-LeftMouse>", func = "definition()"},
        --{key  = "g<LeftMouse>",  func = "implementation()"},
        --{key  = "<Leader>k",     func = "require('navigator.dochighlight').hi_symbol()"},
        --{key  = '<Space>wa',     func = 'add_workspace_folder()'},
        --{key  = '<Space>wr',     func = 'remove_workspace_folder()'},
        --{key  = '<Space>ff',     func = 'formatting()', mode='n'},
        --{key  = '<Space>ff',     func = 'range_formatting()', mode='v'},
        --{key  = '<Space>wl',     func = 'print(vim.inspect(vim.lsp.buf.list_workspace_folders()))'},
        --{key  = "<Space>la",     mode = "n", func = "require('navigator.codelens').run_action()"},
      },
    })

    --require('lspconfig').efm.setup({
    --  init_options = {document_formatting = true},
    --  settings = {
    --    rootMarkers = {".git/"},
    --      },
    --  })
    --local lsp_installer = require('nvim-lsp-installer')
    --local lsp_installer_servers = require('nvim-lsp-installer.servers')

    --lsp_installer.on_server_ready(function(server)
    --  local opts = {}

    --  server:setup(opts)
    --  vim.cmd [[ do User LspAttachBuffers ]]
    --end)
  end,
}

return M
