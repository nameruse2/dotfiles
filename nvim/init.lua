
require "keymaps"  -- Imports keymappings from lua/keymaps.lua
require "options" -- Options settings
require "lazy-config"
require "whichkey"
require "bufferline-config"
require "lualine-config"
require "hop-config"
require "nvim-tree-config"
require "telescope-config"
require "alpha-config"
require "treesitter-config"
require "lsp-config"
require "toggleterm-config"
require "autopairs-config"
require "undotree-config"
require "indentline-config"
require "telekasten-config"
require "neorg-config"
require "orgmode-config"


--[[

  'tpope/vim-sleuth',

  { -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

--]]
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
