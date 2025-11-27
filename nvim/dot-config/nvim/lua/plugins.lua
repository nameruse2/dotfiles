-- ##########
-- [[ Plugins ]]
-- ##########

local ok, MiniDeps = pcall(require, 'mini.deps')
if not ok then
  vim.notify('[WARN] mini.deps module not found', vim.log.levels.WARN)
  return
end

require('mini.deps').setup()
local add = MiniDeps.add
add('neovim/nvim-lspconfig')
add('folke/tokyonight.nvim')
add('mason-org/mason.nvim')
add("ibhagwan/fzf-lua")
add('nvim-treesitter/nvim-treesitter')

require("fzf-lua").setup()
require("mason").setup({})
require('mini.pick').setup({})
require('mini.completion').setup()
require('mini.icons').setup()
require('mini.indentscope').setup()
require('mini.statusline').setup()
require('mini.files').setup()
require('mini.surround').setup()
require('mini.extra').setup()
require('mini.jump').setup()
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "python", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
  sync_install = false,
  auto_install = true,
  ignore_install = { "javascript" },
  highlight = { enable = true },
}


local miniclue = require('mini.clue')
miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
    { mode = 'n', keys = 'm' },
    { mode = 'n', keys = 's' },
  },
  postkeys_window_delay = 10,
  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
})
