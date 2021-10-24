---[[---------------------------------------]]---
--                 SmithWebDev                 --
--                  AutoCmds                   --
---[[---------------------------------------]]---
local auto = vim.api.nvim_exec

-- Automatically exit from Insert mode
auto(
  [[
    augroup exitInsert
      au CursorHoldI * stopinsert
      au InsertEnter * let updaterestore=&updatetime | set updatetime=2500
      au InsertLeave * let &updatetime=updaterestore
    augroup END
  ]], false
  )

-- Remove trailing whitespace on save
auto(
  [[
    autocmd BufWritePre * :%s/\s\+$//e
  ]], false
  )

-- Help files open to the right of the current buffer
auto(
  [[
    autocmd Filetype help wincmd L
  ]], false
  )

-- Saves on text change or exit Insert mode
auto(
  [[
    augroup autosave
        au!
        let blacklist = ['packer', 'netrw', 'TelescopePrompt', 'lspinfo', 'lsp-installer', 'query', 'tsplayground']
        au BufEnter * if &filetype == "" | setlocal ft=text | endif
        au TextChanged,InsertLeave * if index(blacklist, &ft) < 0 && &modifiable| silent w | endif
    augroup END
  ]], false
  )

-- let blacklist = ['packer', 'NvimTree', 'netrw', 'TelescopePrompt', 'spectre_panel', 'startify', 'calendar', 'text', 'help', 'Trouble', 'tutor', 'Neoformat', 'lspinfo', 'any-jump', 'tsplayground', 'orgagenda', 'gina-branch', 'lazygit','LspSagaCodeAction']
