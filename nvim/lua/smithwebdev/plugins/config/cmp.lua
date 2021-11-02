local M = {}

M.plugin = {
  'hrsh7th/nvim-cmp',

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
    'honza/vim-snippets',
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

    cmp.setup.cmdline(':', {
      sources = {
        {name = 'cmdline'}
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
        { name = 'nvim_lua'},
        { name = 'look'},
        { name = 'buffer'},
        { name = 'path'},
      },

      mapping = {
        ["<C-Space>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
              return press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
            end

            cmp.select_next_item()
          elseif has_any_words_before() then
            press("<Space>")
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
          if cmp.get_selected_entry() == nil and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
            press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
          elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
            press("<ESC>:call UltiSnips#JumpForwards()<CR>")
          elseif cmp.visible() then
            cmp.select_next_item()
          elseif has_any_words_before() then
            press("<Tab>")
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
      },
      completion = {},

      formatting      = {
        format        = lspkind.cmp_format({
          with_text   = false,
          maxwidth    = 50,
          menu        = ({
            nvim_lsp  = '[LSP]',
            nvim_lua  = '[Lua]',
            --vsnip   = '[Snip]',
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
