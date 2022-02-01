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
    'ray-x/lsp_signature.nvim',        -- https://github.com/ray-x/lsp_signature.nvim
    { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
  },

  -- Setup navigator.lua settings AFTER the plugin (navigator.lua) is loaded
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.preselectSupport = true
    capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
    capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
    capabilities.textDocument.completion.completionItem.deprecatedSupport = true
    capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
    capabilities.textDocument.completion.completionItem.tagSupport = {valueSet = {1}}
    capabilities.textDocument.completion.completionItem.resolveSupport = {
     properties = {'documentation', 'detail', 'additionalTextEdits'}
     }
     capabilities.workspace.configuration = true

---@diagnostic disable-next-line: redundant-value
    require('lsp_signature').setup()

    require('nvim-autopairs').setup({
      disable_filetype = {"TelescopePrompt", "guihua", "guihua_rust", "clap_input"},

--      if vim.o.ft == "clap_input" and vim.o.ft == "guihua" and vim.o.ft == "guihua_rust" then
--        require'cmp'.setup.buffer {completion = {enable = false} }
--      end
    })

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
        {key  = "<leader>lca",    mode = "n", func = "require('navigator.codeAction').code_action()"},
        {key  = "<leader>lcl",    mode = "n", func = "require('navigator.codelens').run_action()"},
        {key  = "<leader>ldp",    func = "require('navigator.definition').definition_preview()"},
        {key  = "<leader>lgd",    func = "require('navigator.diagnostics').show_diagnostics()"},
        {key  = "<leader>lbd",    func = "require('navigator.diagnostics').show_buf_diagnostics()"},
        --{key  = "<Leader>k",    func = "require('navigator.dochighlight').hi_symbol()"},
        {key  = "<leader>lrf",    func = "require('navigator.reference').reference()"},
        {key  = "<leader>lrn",    func = "require('navigator.rename').rename()"},
        {key  = "<leader>lds",    func = "require('navigator.symbols').document_symbols()"},
        {key  = "<leader>lbT",    func = "require('navigator.treesitter').buf_ts()"},
        --{key  = "<Leader>gT",   func = "require('navigator.treesitter').bufs_ts()"},
        {key  = "<leader>lnn",    func = "require('navigator.treesitter').goto_next_usage()"},
        {key  = "<leader>lpp",    func = "require('navigator.treesitter').goto_previous_usage()"},

        {key  = "<leader>lsh",    func = "signature_help()"},
        --{key  = "gW",           func = "workspace_symbol()"},
        {key  = "<leader>lD",     func = "declaration({ border = 'rounded', max_width = 80 })"},
        {key  = "K",              func = "hover({ popup_opts = { border = single, max_width = 80 }})"},
        {key  = "<leader>lca",    mode = "v", func = "range_code_action()"},
        --{key  = "<leader>lrn",  func = "rename()"},
        --{key  = "<leader>gi",   func = "incoming_calls()"},
        --{key  = "<leader>go",   func = "outgoing_calls()"},
        {key  = "<leader>li",     func = "implementation()"},
        --{key  = "<leader>D",    func = "type_definition()"},
        {key  = "<leader>ldn",    func = "diagnostic.goto_next({ border = 'rounded', max_width = 80})"},
        {key  = "<leader>ldp",    func = "diagnostic.goto_prev({ border = 'rounded', max_width = 80})"},
        {key  = "<leader>ldf",    func = "definition()"},
        --{key  = "g<LeftMouse>", func = "implementation()"},
        --{key  = '<leader>wa',   func = 'add_workspace_folder()'},
        --{key  = '<leader>wr',   func = 'remove_workspace_folder()'},
        {key  = '<leader>lm',     func = 'formatting()', mode='n'},
        {key  = '<leader>lm',     func = 'range_formatting()', mode='v'},
        {key  = '<leader>lw',     func = 'print(vim.inspect(vim.lsp.buf.list_workspace_folders()))'},
        --{key  = "<M-k>",        mode = "i", func = "signature_help()"},
      },
      --html = {
      --  filetype = {'erb'}
      --    }
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
