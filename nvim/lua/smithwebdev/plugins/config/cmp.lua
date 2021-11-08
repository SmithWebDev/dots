local M = {}

M.plugin = {
  'hrsh7th/nvim-cmp',

  after = 'vim-endwise',

  requires = {
    'hrsh7th/cmp-nvim-lsp',                -- https://github.com/hrsh7th/cmp-nvim-lsp
    'hrsh7th/cmp-nvim-lua',                -- https://github.com/hrsh7th/cmp-nvim-lua
    'hrsh7th/cmp-buffer',                  -- https://github.com/hrsh7th/cmp-buffer
    'octaltree/cmp-look',                  -- https://github.com/octaltree/cmp-look
    'rafamadriz/friendly-snippets',        -- https://github.com/rafamadriz/friendly-snippets
    'onsails/lspkind-nvim',                -- https://github.com/onsails/lspkind-nvim},
    'hrsh7th/cmp-path',                    -- https://github.com/hrsh7th/cmp-path
    'quangnguyen30192/cmp-nvim-ultisnips', -- https://github.com/quangnguyen30192/cmp-nvim-ultisnips
    'hrsh7th/cmp-cmdline',                 -- https://github.com/hrsh7th/cmp-cmdline
    'honza/vim-snippets',                  -- https://github.com/honza/vim-snippets
    'quangnguyen30192/cmp-nvim-tags',      -- https://github.com/quangnguyen30192/cmp-nvim-tags
  },

  config = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')

    local has_any_words_before = function()
      if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
      end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local press = function(key)
      vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes(key, true, true, true),
        "n", true)
    end

    cmp.setup.cmdline(
      ':', {
        sources = {
          {name = 'cmdline'}
        },
      })
      cmp.setup.cmdline(
      '/', {
      sources = {
          {name = 'buffer'}
      }
      })

    cmp.setup({

      snippet = {
        expand = function(args)
          if vim.fn.exists('*vsnip#anonymous') == 1 then
            vim.fn["vsnip#anonymous"](args.body)
          else
            vim.fn["UltiSnips#Anon"](args.body)
          end
        end,
      },

      sources = {
        { name = 'ultisnips'},
        { name = 'nvim_lsp'},
        { name = 'tags'},
        { name = 'buffer'},
        { name = 'nvim_lua'},
        { name = 'look'},
        { name = 'path'},
      },

      mapping = {
        ["<CR>"]  = cmp.mapping.confirm(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-y>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
        ["jk"] = cmp.mapping(function(fallback)
          if cmp.get_selected_entry() == nil and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
            press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
          elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
            press("<ESC>:call UltiSnips#JumpForwards()<CR>")
          else
            fallback()
          end
        end, {
          "i",
          "s",
          -- add this line when using cmp-cmdline:
           "c",
        }),
        ["<C-j>"] = cmp.mapping(function(fallback)
          if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
            press("<ESC>:call UltiSnips#JumpForwards()<CR>")
          elseif cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, {
          "i",
          "s",
          -- add this line when using cmp-cmdline:
          "c",
        }),
        ["<C-k>"] = cmp.mapping(function(fallback)
          if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
            press("<ESC>:call UltiSnips#JumpBackwards()<CR>")
          elseif cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, {
          "i",
          "s",
          -- add this line when using cmp-cmdline:
          "c",
        }),
        ["<C-Space>"] = cmp.mapping(function()
          if vim.fn.complete_info().selected == -1 then
            if cmp.visible() then
              cmp.close()
            end
          else
            cmp.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          })
          end
        end, {
          "i",
          "s",
          -- add this line when using cmp-cmdline:
          "c",
        }),
      },
      completion = {},

      formatting      = {
        format        = lspkind.cmp_format({
          with_text   = false,
          maxwidth    = 50,
          menu        = ({
            ultisnips = '[Snip]',
            tags      = '[Tags]',
            nvim_lsp  = '[LSP]',
            nvim_lua  = '[Lua]',
            buffer    = '[Buffer]',
            path      = '[Path]'
            })
          })
        },

        experimental  = {
          ghost_text  = true,
          native_menu = false
        },
    })
  end,
}

return M
