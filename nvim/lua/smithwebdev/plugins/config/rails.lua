local M = {}

M.plugin = {
  'tpope/vim-rails',

  requires = {
    'tpope/vim-endwise',             --,       https://github.com/tpope/vim-endwise
    'joshcheek/seeing_is_believing', --,       https://github.com/JoshCheek/seeing_is_believing
    'tpope/vim-dispatch',            --,       https://github.com/tpope/vim-dispatch
    'tpope/vim-projectionist', --,             https://github.com/tpope/vim-projectionist
  },

  after = 'mapx.nvim',

  config = function()
    -- keybindings
    nnoremap('<leader>rba', '!bundle add ')
    nnoremap('<leader>rbi', '!bundle install<CR>')
    nnoremap('<leader>rc', '<cmd>Console!<CR>')
    nnoremap('<leader>rs', '<cmd>Server!<CR>')


    nnoremap('<leader>rg', '<cmd>Generate ')
    nnoremap('<leader>rd', '<cmd>Destroy ')

    -- Invoking :Rails with no arguments runs a default task.
    nnoremap('<leader>rR', '<cmd>Rails<CR>')
    -- File                            Task ~
    -- test/*_test.rb                  test TEST=test/*_test.rb
    -- spec/*_spec.rb                  spec SPEC=spec/*_spec.rb
    -- features/*.feature              cucumber FEATURE=features/*.feature
    -- app/*.rb                        test TEST=... | spec SPEC=...
    -- test/fixtures/*.yml             db:fixtures:load FIXTURES=*
    -- config.ru                       middleware
    -- config/routes.rb                routes
    -- db/migrate/*_*.rb               db:migrate:redo VERSION=*
    -- db/schema.rb                    db:migrate:status
    -- db/seeds.rb                     db:seed
    -- README                          about



    -- Current file,           Alternate file(:A),   Related file(:R)
    -- model,                  unit test,            schema definition
    -- controller (in method), functional test,      template (view)
    -- template (view),        functional test,      controller (jump to method)
    -- migration,              previous migration,   next migration
    -- database.yml,           database.example.yml, environments/*.rb

    -- Edits to "Alternative" file in various locations
    nnoremap('<leader>ra', '<cmd>A<CR>')
    nnoremap('<leader>rae', '<cmd>AE<CR>') --, 'edit alternate file'
    nnoremap('<leader>ras', '<cmd>AS<CR>') --, 'edit alternate in h split'
    nnoremap('<leader>rav', '<cmd>AV<CR>') --, 'edit alternate in tab'},
    nnoremap('<leader>rat', '<cmd>AT<CR>') --, 'edit alternate in v split'


    -- Edits to "Relative" file in various locations
    nnoremap('<leader>re', '<cmd>R<CR>')
    nnoremap('<leader>ree', '<cmd>RE<CR>') --, 'edit relative file'
    nnoremap('<leader>res', '<cmd>RS<CR>') --, 'edit relative in h split'
    nnoremap('<leader>rev', '<cmd>RV<CR>') --, 'edit relative in tab'
    nnoremap('<leader>ret', '<cmd>RT<CR>') --, 'edit relative in v split'
  end
}

return M




--    b = {':!bundle install<cr>', 'Bundle Install'},
--    name = '+rails',
--    e = {":Extract ",                                           'Extracts range to Partial, Helper, Concern'}



