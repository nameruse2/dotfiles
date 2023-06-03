-- [[ Setting options ]]
-- See `:help vim.o`
vim.o.hlsearch = false -- Set highlight on search
vim.o.number = true -- Make line numbers default
vim.o.mouse = 'a' -- Enable mouse mode
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.o.breakindent = true -- Enable break indent
vim.o.undofile = true -- Save undo history
vim.o.ignorecase = true -- Case insensitive searching
vim.o.smartcase = true
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = 'longest,menuone,noselect' -- Set completeopt to have a better completion experience

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.o.autowrite = true -- Enable auto write. NOTE may need to try autowriteall
-- opt.conceallevel = 3 -- Hide * markup for bold and italic
vim.o.confirm = true -- Confirm to save changes before exiting modified buffer
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.grepprg = "rg --vimgrep"
-- opt.inccommand = "nosplit" -- preview incremental substitute
vim.o.scrolloff = 4 -- Lines of context
-- opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.o.shiftround = true -- Round indent
vim.o.shiftwidth = 2 -- Size of an indent
-- opt.shortmess:append({ W = true, I = true, c = true })
-- opt.showmode = false -- Dont show mode since we have a statusline
vim.o.sidescrolloff = 8 -- Columns of context
vim.o.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.smartindent = true -- Insert indents automatically
-- vim.o.spelllang = { "en_gb" }
vim.o.splitbelow = true -- Put new windows below current
vim.o.splitright = true -- Put new windows right of current
vim.o.tabstop = 4 -- Number of spaces tabs count for
vim.o.undolevels = 10000
-- opt.wildmode = "longest:full,full" -- Command-line completion mode

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
