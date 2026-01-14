local vim = vim
local keymap = vim.keymap.set
-- [[ Basic Keymaps ]]

keymap('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clear highlights on search when pressing <Esc> in normal mode
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

keymap('i', 'jk', '<ESC>', {desc='Normal mode'}) -- Easier to use with home keys
keymap('i', 'kj', '<ESC>', {desc='Normal mode'}) -- Easier to use with home keys

keymap('n', 'H', '0', {desc='Goto start of line'}) -- Easier to use with home keys
keymap('n', 'L', '$', {desc='Goto end of line'}) -- Easier to use with home keys

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- leader keys
keymap('n', '<leader>/', '<cmd>FzfLua live_grep<cr>', {desc='Search file'})
keymap('n', '<leader>e', '<cmd>Lexplore<cr>', {desc='File Explorer'})
keymap('n', '<leader>d', '<cmd>FzfLua diagnostics_document<cr>', { desc = 'Diagnostics' })
keymap('n', '<leader>s', '<cmd>FzfLua lsp_document_symbols<cr>', { desc = 'LSP Symbols' })
keymap('n', '<leader>f', '<cmd>FzfLua files<cr>', {desc='Find file'})
keymap('n', '<leader>b', '<cmd>FzfLua buffers<cr>', {desc='Buffers'})
keymap('n', '<leader>r', '<cmd>FzfLua registers<cr>', {desc='Registers'})
keymap('n', '<leader>z', '<cmd>FzfLua zoxide<cr>', {desc='Zoxide (cd)'})
-- keymap('n', '<leader>n', '<cmd>FzfLua files cwd=~/Documents/notes/<cr>', {desc='Notes'})
keymap('n', '<leader>q', '<cmd>q<cr>', {desc='Quit'})
keymap('n', '<leader>w', '<cmd>w<cr>', {desc='Write'})

--Notes
-- keymap('n', '<leader>nd', '<cmd>lua require('notes').open_daily_note()<CR>', {desc = 'Daily Note' })
