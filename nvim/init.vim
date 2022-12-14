" use global clipboard
set clipboard+=unnamedplus

" save undo-trees in files
set undofile
set undodir=$HOME/.config/nvim/undo
" number of undo saved
set undolevels=10000
set undoreload=10000

" use 4 spaces instead of tab ()
" copy indent from current line when starting a new line
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Load some standard configs.
set number
set ignorecase
set smartcase
set mouse=a
set hlsearch
syntax on
syntax enable
