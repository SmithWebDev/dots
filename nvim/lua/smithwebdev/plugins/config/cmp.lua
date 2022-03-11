local M = {}

M.plugin = {
  'hrsh7th/nvim-cmp',

  --after = 'vim-endwise',

  requires = {
    'hrsh7th/cmp-nvim-lsp',                -- https://github.com/hrsh7th/cmp-nvim-lsp
    'hrsh7th/cmp-nvim-lua',                -- https://github.com/hrsh7th/cmp-nvim-lua
    'hrsh7th/cmp-buffer',                  -- https://github.com/hrsh7th/cmp-buffer
    'octaltree/cmp-look',                  -- https://github.com/octaltree/cmp-look
    'rafamadriz/friendly-snippets',        -- https://github.com/rafamadriz/friendly-snippets
    'onsails/lspkind-nvim',                -- https://github.com/onsails/lspkind-nvim},
    'hrsh7th/cmp-path',                    -- https://github.com/hrsh7th/cmp-path
    'hrsh7th/cmp-cmdline',                 -- https://github.com/hrsh7th/cmp-cmdline
    'honza/vim-snippets',                  -- https://github.com/honza/vim-snippets
    'quangnguyen30192/cmp-nvim-tags',      -- https://github.com/quangnguyen30192/cmp-nvim-tags
    'quangnguyen30192/cmp-nvim-ultisnips', -- https://github.com/quangnguyen30192/cmp-nvim-ultisnips
    'windwp/nvim-autopairs',               -- https://github.com/windwp/nvim-autopairs
    'ray-x/cmp-treesitter',                -- https://github.com/ray-x/cmp-treesitter
    'saadparwaiz1/cmp_luasnip',            -- https://github.com/saadparwaiz1/cmp_luasnip
  },
 
  config = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')

    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

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
        { name = 'nvim_lsp'},
        { name = 'orgmode'},
        { name = 'nvim_lua'},
        { name = 'treesitter'},
        --{ name = 'look'},
      },

      mapping = {
        ["<CR>"]  = cmp.mapping.confirm(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-j>"] = cmp.mapping.select_next_item{ 
          behavior = cmp.SelectBehavior.Select 
        },
        ["<C-k>"] = cmp.mapping.select_prev_item{ 
          behavior = cmp.SelectBehavior.Select 
        },
        ["<C-y>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
        ["jk"] = cmp.mapping(function(fallback)
          if cmp.get_selected_entry() == nil and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
            press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
          elseif cmp.get_selected_entry() == 1 then
            cmp.mapping.confirm()
          else
            fallback()
          end
        end, {
          "i",
          "s",
          -- add this line when using cmp-cmdline:
           "c",
        }),
        --["<C-j>"] = cmp.mapping(function(fallback)
        --  if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        --    press("<ESC>:call UltiSnips#JumpForwards()<CR>")
        --  elseif cmp.visible() then
        --    cmp.select_next_item()
        --  else
        --    fallback()
        --  end
        --end, {
        --  "i",
        --  "s",
        --  -- add this line when using cmp-cmdline:
        --  "c",
        --}),
        --["<C-k>"] = cmp.mapping(function(fallback)
        --  if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
        --    press("<ESC>:call UltiSnips#JumpBackwards()<CR>")
        --  elseif cmp.visible() then
        --    cmp.select_prev_item()
        --  else
        --    fallback()
        --  end
        --end, {
        --  "i",
        --  "s",
        --  -- add this line when using cmp-cmdline:
        --  "c",
        --}),
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
        ["<C-p>"] = cmp.mapping(function ()
          if has_any_words_before() then
            cmp.setup.buffer {
              sources = {
                {name = 'path'}
                }
              }
            cmp.complete()
          end
        end, {
          "i",
          "s",
          -- add this line when using cmp-cmdline:
          "c",
        }),
        ["<C-t>"] = cmp.mapping(function ()
          if has_any_words_before() then
            cmp.setup.buffer {
              sources = {
                {name = 'tags'}
                }
              }
            cmp.complete()
          end
        end, {
          "i",
          "s",
          -- add this line when using cmp-cmdline:
          "c",
        }),
        ["<C-s>"] = cmp.mapping(function ()
          if has_any_words_before() then
            cmp.setup.buffer {
              sources = {
                {name = 'ultisnips'}
                }
              }
            cmp.complete()
          end
        end, {
          "i",
          "s",
          -- add this line when using cmp-cmdline:
          "c",
        }),
        ["<C-b>"] = cmp.mapping(function ()
          if has_any_words_before() then
            cmp.setup.buffer {
              sources = {
                {name = 'buffer'}
                }
              }
            cmp.complete()
          end
        end, {
          "i",
          "s",
          -- add this line when using cmp-cmdline:
          "c",
        })
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
            orgmode   = '[Orgmode]',
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
