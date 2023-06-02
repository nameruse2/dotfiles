let mapleader = " " " map leader to Space
" Bootstrap vim-plug.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dhruvasagar/vim-dotoo'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'valloric/youcompleteme'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-speeddating'
Plug 'easymotion/vim-easymotion'
Plug 'luochen1990/rainbow'
Plug 'dbeniamine/todo.txt-vim'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/alok/notational-fzf-vim'
Plug 'liuchengxu/vim-which-key'
call plug#end()

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" By default timeoutlen is 1000 ms
set timeoutlen=500
let g:which_key_map =  {}
let g:which_key_map.c = { 'name' : '+commenter' }


" Load some standard configs.
set encoding=UTF-8
set clipboard=unnamedplus
set number
set ignorecase
set smartcase
set mouse=a
set hlsearch
set incsearch
set magic
set showmatch
set background=dark
set termguicolors
colorscheme onedark
syntax on
syntax enable
filetype plugin on
filetype indent on
"Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
set wildmenu
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


nmap <leader>w :w!<cr>

if executable('fzf')
  " Remap ctrl-P to execute fzf.
  nnoremap <silent> <C-p> :Files<CR>
  " Show previews with fzf window.
  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
endif

if executable('fd')
  " Use fd for fzf searches.
  let $FZF_DEFAULT_COMMAND = 'fd --type f'
endif

" example
let g:nv_search_paths = ['~/notes']

nnoremap <leader>e :NERDTreeToggle<CR>

" Orgmode ToDoo settings
let g:dotoo#parser#todo_keywords = ["TODO", "WAITING", "DONE"]
let g:dotoo#agenda#files = ['~/notes/*.org']
let g:dotoo#capture#refile = expand('~/notes/Inbox.org')
let g:dotoo#agenda_views#agenda#span = 'week'
let g:org_agenda_files=['~/notes/*.org']
let g:dotoo#agenda#warning_days = '0d'

" Source custom configs (not under version control).
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
