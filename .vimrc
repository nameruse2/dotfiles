" This is a minimal Vim config that's geared to be useful on new machines.
" All new configs will go into Neovim.

" Bootstrap vim-plug.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins
call plug#begin()
" Optionally manage fzf here. Neovim does the same.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jceb/vim-orgmode'
Plug 'dhruvasagar/vim-dotoo'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'valloric/youcompleteme'
call plug#end()

" Load some standard configs.
set number
set ignorecase
set smartcase
set mouse=a
set hlsearch
set background=dark
set termguicolors
colorscheme onedark
syntax on
syntax enable
filetype plugin on

let mapleader = " " " map leader to Space

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

nnoremap <leader>e :NERDTreeToggle<CR>

" Orgmode ToDoo settings
let g:dotoo#parser#todo_keywords = ["TODO", "WAITING", "DONE"]
let g:dotoo#agenda#files = ['~/notes/*.org']
let g:dotoo#capture#refile = expand('~/notes/Inbox.org')
let g:dotoo#agenda_views#agenda#span = 'week'

" Source custom configs (not under version control).
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
