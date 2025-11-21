-- ##########
-- [[ Options ]]
-- ##########
local o = vim.o
local g = vim.g

g.mapleader = ' ' -- Set <space> as the leader key
g.maplocalleader = ' '
g.have_nerd_font = true -- Set to true if you have a Nerd Font installed and selected in the terminal
o.number = true -- Set line numbers
o.relativenumber = true -- Set relative line numbers
o.mouse = 'a' -- Enable mouse
o.clipboard = 'unnamedplus'
o.tabstop = 4 --tab=4 spaces
o.shiftwidth = 4 --spaces for indentation
o.softtabstop = 4
o.expandtab = true -- Tabs to spaces
o.list = true -- show trailing characters
o.backspace = "indent,eol,start"
o.completeopt = 'menu,menuone,noinsert'
o.breakindent = true -- keep wrapped lines indented
o.undofile = true -- Save undo history
o.ignorecase = true
o.smartcase = true
o.splitright = true
o.splitbelow = true
o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
o.inccommand = 'split' -- Preview substitutions live, as you type!
o.cursorline = true
o.scrolloff = 10
o.confirm = true
o.foldmethod = "indent"
o.foldlevelstart = 99
-- vim.o.grepprg = "rg --vimgrep --smart-case --hidden"
-- vim.o.grepformat = "%f:%l:%c:%m"


