local M = {}

M.plugin = {
  'tpope/vim-rails',

  requires = {
    'christoomey/vim-rfactory',      --,                          https://github.com/christoomey/vim-rfactory
    'tpope/vim-endwise',             --,                          https://github.com/tpope/vim-endwise
    'joshcheek/seeing_is_believing', --,                          https://github.com/JoshCheek/seeing_is_believing
    'tpope/vim-dispatch',            --,                          https://github.com/tpope/vim-dispatch
    'tpope/vim-projectionist',       --,                          https://github.com/tpope/vim-projectionist
  },

  after = 'mapx.nvim',

  config = function()
    -- keybindings
    nnoremap('<leader>rba',          ':!bundle add<Space>') --,   Bundle Add Command
    nnoremap('<leader>rbi',          ':!bundle install<CR>') --,  Bundle Install Command
    nnoremap('<leader>rbu',          ':!bundle update<CR>') --,   Bundle Update Command
    nnoremap('<leader>rc',           '<cmd>Console!<CR>') --,     Open Rails Console New Tmux Window
    nnoremap('<leader>rs',           '<cmd>Server!<CR>') --,      Open Rails Server New Tmux Window


    nnoremap('<leader>rD',           ':Destroy<Space>') --,       Rails Destroy Command
    nnoremap('<leader>rg',           ':Generate<Space>') --,      Rails Generate Command
    nnoremap('<leader><leader>r',    '!rails<Space>') --,         Rails CLI command

    nnoremap('<leader>rdbm',         '!rails db:migrate<CR>') --, Rails DB:Migrate Command
    nnoremap('<leader>rdbs',         '!rails db:setup') --,       Rails DB:Setup Command
    nnoremap('<leader>rdbS',         '!rails db:seed') --,        Rails DB:Seed Command
    --nnoremap('',                   '')
    --nnoremap('',                   '')


    -- Invoking :Rails with no arguments runs a default task.
    nnoremap('<leader>rR',           '<cmd>Rails<CR>')
    -- File,                         Task ~
    -- test/*_test.rb,               test TEST=test/*_test.rb
    -- spec/*_spec.rb,               spec SPEC=spec/*_spec.rb
    -- features/*.feature,           cucumber FEATURE=features/*.feature
    -- app/*.rb,                     test TEST=... | spec SPEC=...
    -- test/fixtures/*.yml,          db:fixtures:load FIXTURES=*
    -- config.ru,                    middleware
    -- config/routes.rb,             routes
    -- db/migrate/*_*.rb,            db:migrate:redo VERSION=*
    -- db/schema.rb,                 db:migrate:status
    -- db/seeds.rb,                  db:seed
    -- README,                       about



    -- Current file,                 Alternate file(:A),          Related file(:R)
    -- model,                        unit test,                   schema definition
    -- controller (in method),       functional test,             template (view)
    -- template (view),              functional test,             controller (jump to method)
    -- migration,                    previous migration,          next migration
    -- database.yml,                 database.example.yml,        environments/*.rb

    -- Edits to "Alternative" file in various locations
    nnoremap('<leader>ra',           '<cmd>A<CR>')
    nnoremap('<leader>rae',          '<cmd>AE<CR>') --,           'edit alternate file'
    nnoremap('<leader>ras',          '<cmd>AS<CR>') --,           'edit alternate in h split'
    nnoremap('<leader>rav',          '<cmd>AV<CR>') --,           'edit alternate in tab'},
    nnoremap('<leader>rat',          '<cmd>AT<CR>') --,           'edit alternate in v split'


    -- Edits to "Relative" file in various locations
    nnoremap('<leader>re',           '<cmd>R<CR>')
    nnoremap('<leader>ree',          '<cmd>RE<CR>') --,           'edit relative file'
    nnoremap('<leader>res',          '<cmd>RS<CR>') --,           'edit relative in h split'
    nnoremap('<leader>rev',          '<cmd>RV<CR>') --,           'edit relative in tab'
    nnoremap('<leader>ret',          '<cmd>RT<CR>') --,           'edit relative in v split'


    -- Partial Extraction
    vnoremap('<leader>rex',          ':Extract ') --,             'extract to partial'

    -- Rfactory
    nnoremap('<leader>rf',           '<cmd>Rfactory<CR>') --,     'Edit Factory File'
    nnoremap('<leader>rfs',          '<cmd>RSfactory<CR>') --,    'Edit Factory File in H Split'
    nnoremap('<leader>rfv',          '<cmd>RVfactory<CR>') --,    'Edit Factory File in V Split'
    nnoremap('<leader>rft',          '<cmd>RTfactory<CR>') --,    'Edit Factory File in Tab'

    -- Preview Page
    nnoremap('<leader>rp',           ':Preview<CR>') --,          'open web browser for current view'

    -- Run Ctags for Ruby/Rails program, includes gems
    nnoremap('<leader>rt',               ':!ctags -R --languages=Ruby --exclude=.git --exclude=log . $(bundle list --paths) && echo "tags" >> .gitignore<CR>') --,  create ctags for project incl bundled gems
  end
}

return M
