-- ~/.config/nvim/init.lua
require('options') -- Basic options
require('plugins') -- Plugins - downloads and configs
local dnote = require("notes")
require('keymaps') -- All keymaps here

vim.cmd('colorscheme tokyonight') -- Colourscheme goes here. Needs to be loaded after plugins


vim.lsp.enable({
    'basedpyright', -- ~/.config/nvim/lsp/basedpyright.lua
    'lua_ls', -- ~/.config/nvim/lsp/lua-ls.lua
    'fish_lsp',
    'jsonlsp',
    'markdown_oxide', -- config at ~/.config/moxide/settings.toml
})

vim.diagnostic.config({ virtual_text = true })
-- https://neovim.io/doc/user/lsp.html
-- vonheikemen.github.io/learn-nvim/feature/lsp-setup.html
--
--


vim.keymap.set("n", "<leader>nd", dnote.open_daily_note, { noremap = true, silent = true, desc='Daily notes' })
vim.keymap.set("n", "<leader>nn", dnote.new_note, { noremap = true, silent = true, desc='New note' })
vim.keymap.set('n', '<leader>nf', '<cmd>FzfLua files cwd=~/Documents/notes/<cr>', {desc='Notes'})
vim.keymap.set("n", "<S-Up>", dnote.prev_daily_note, { noremap = true, silent = true })
vim.keymap.set("n", "<S-Down>", dnote.next_daily_note, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ng', '<cmd>FzfLua live_grep cwd=~/Documents/notes/<cr>', {desc='Grep notes'})
