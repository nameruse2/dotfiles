-- code for nvim-tree = disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- setting files for plugins
require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.cmp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.nvim-tree"
require "user.toggleterm"
require "user.orgmode"

-- set colourscheme
vim.cmd "colorscheme tokyonight"

