-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { import = 'plugins' },
  'theprimeagen/harpoon',
  'tpope/vim-fugitive',
  'kdheepak/lazygit.nvim',
  'lewis6991/gitsigns.nvim',
  {'nvim-tree/nvim-tree.lua',
    dependencies = {"nvim-tree/nvim-web-devicons"},
    keys = {{'<leader>t', "<cmd>NvimTreeToggle<CR>", desc = '[T]ree' }},
  }



}, {})

require('options')
require('keymaps')


require('nvim-tree').setup()
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
