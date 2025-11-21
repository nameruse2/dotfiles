-- ~/.config/nvim/init.lua

require('options') -- Basic options
require('plugins') -- Plugins - downloads and configs
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
