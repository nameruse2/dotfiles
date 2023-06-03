-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = 'Move to left window' })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = 'Move up a window' })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = 'Move down a window' })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = 'Move to right window' })

-- insert --
-- press jk fast to exit insert mode 
vim.keymap.set("i", "jk", "<esc>") 
vim.keymap.set("i", "kj", "<esc>")
-- navigate buffers
vim.keymap.set("n", "<s-l>", ":bnext<cr>") -- Next Tab 
vim.keymap.set("n", "<s-h>", ":bprevious<cr>") -- Previous tab
-- Resize with arrows when using multiple windows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<c-down>", ":resize +2<cr>")
vim.keymap.set("n", "<c-right>", ":vertical resize -2<cr>")
vim.keymap.set("n", "<c-left>", ":vertical resize +2<cr>")
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "grep"})
vim.keymap.set('n', '<leader>b', builtin.buffers, {desc = "Buffers"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "help"})
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {desc = "recent"})
