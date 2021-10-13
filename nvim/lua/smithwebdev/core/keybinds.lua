---[[---------------------------------------]]---
--                 SmithWebDev                 --
--                   Keybinds                  --
---[[---------------------------------------]]---
--require 'smithwebdev.core.utilities'
default_opts = {noremap = true, silent = true}

-- Map Leader
----------------------------------------
vim.g.mapleader = " "

-- Alternative Standards
----------------------------------------
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', default_opts) --(, 'Exit Insert Mode')
vim.api.nvim_set_keymap('n', 'H','0', default_opts) --(, 'Alternative Begin Line')
vim.api.nvim_set_keymap('n', 'L','$', default_opts) --(, 'Alternative End Line')
vim.api.nvim_set_keymap('n', 'Y','yg_', default_opts) --(, 'Alternative Copy to End of Line')

-- Disable Highlights
----------------------------------------
vim.api.nvim_set_keymap("n", "<leader><CR>", "<cmd>noh<CR>", default_opts) --(, 'Disable Highlights')

-- Resize Window Panes
----------------------------------------
vim.api.nvim_set_keymap('n', '<up>', ':resize +2<CR>', default_opts) --(, 'Resize Window Up)
vim.api.nvim_set_keymap('n', '<down>', ':resize -2<CR>', default_opts) --(, 'Resize Window Down)
vim.api.nvim_set_keymap('n', '<left>', ':vertical resize +2<CR>', default_opts) --(, 'Resize Window Left)
vim.api.nvim_set_keymap('n', '<right>', ':vertical resize -2<CR>', default_opts) --(, 'Resize Window Right)

-- Tabs
----------------------------------------
vim.api.nvim_set_keymap('n', '<Tab>', ':tabnext<CR>', default_opts) --(, 'Goto Tab Next')
vim.api.nvim_set_keymap('n', '<S-Tab>', ':tabprev<CR>', default_opts) --(, 'Goto Tab Previous')
vim.api.nvim_set_keymap('n', '<leader>tc', ':tabc<CR>', default_opts) --(, 'Close Tab')
vim.api.nvim_set_keymap('n', '<leader>te', ':tabedit %<CR>', default_opts) --(, 'Edit File in Tab')
vim.api.nvim_set_keymap('n', '<leader>th', ':tabfirst<CR>', default_opts) --(, 'Goto Tab First')
vim.api.nvim_set_keymap('n', '<leader>tl', ':tablast<CR>', default_opts) --(, 'Goto Tab Last')
vim.api.nvim_set_keymap('n', '<leader>tn', ':tabnew<Space>', default_opts) --(, 'Goto Tab New')
vim.api.nvim_set_keymap('n', '<leader>tt', ':tabs', default_opts) --(, 'Show Tab List')

-- Window Navigation
----------------------------------------
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', default_opts) --(, 'Navigate Left')
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', default_opts) --(, 'Navigate Down')
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', default_opts) --(, 'Navigate Up')
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', default_opts) --(, 'Navigate Right')

-- Window Resize
----------------------------------------
vim.api.nvim_set_keymap('n', 'M', '<C-w>|<C-w>_', default_opts) --(, 'Window Resize Max')
vim.api.nvim_set_keymap('n', '<leader>=', '<C-w>=', default_opts) --(, 'Window Resize Equally')
vim.api.nvim_set_keymap('n', '<leader>|', '<C-w>|', default_opts) --(, 'Window Resize Max Vertically')
vim.api.nvim_set_keymap('n', '<leader>_', '<C-w>_', default_opts) --(, 'Window Resize Max Horizontally')
vim.api.nvim_set_keymap('n', '<leader>\\', '<C-w>v', default_opts) --(, 'Window Split Vertically')
vim.api.nvim_set_keymap('n', '<leader>-', '<C-w>s', default_opts) --(, 'Window Split Horizonatally')

vim.api.nvim_set_keymap('n', '<leader>q', '<C-w>q', default_opts) --(, 'Window Close')

print('Keymaps connected')
