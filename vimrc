" Set no compatbile to avoid problems
set nocompatible
set t_ut=

filetype off

" LEADER KEY
let mapleader = ","

" Set runtype for Vundle
set rtp+=~/.vim/bundle/Vundle.vim

" Starts all plugins
call vundle#begin('~/.vim/plugins')
Plugin 'VundleVim/Vundle.vim'
" Dracula Theme for Vim
Plugin 'dracula/vim', { 'name': 'dracula' }
" File Tree for Vim
Plugin 'scrooloose/nerdtree'
" Fuzzy Search for files
Plugin 'ctrlpvim/ctrlp.vim'
" Search in files
Plugin 'mileszs/ack.vim'
" Commenter
Plugin 'scrooloose/nerdcommenter'
" Syntax for javascript
Plugin 'pangloss/vim-javascript'
" Support for JSX
Plugin 'mxw/vim-jsx'
" Prettier JS linter
Plugin 'prettier/vim-prettier'
"" Linter (used for ruby only)
"Plugin 'w0rp/ale'
"" Bar for displaying linter issues
"Plugin 'vim-airline/vim-airline'
" Time tracking
Plugin 'wakatime/vim-wakatime'
" Git support for vim
Plugin 'tpope/vim-fugitive'
" Github support for vim
Plugin 'tpope/vim-rhubarb'
" Auto Pairs (auto closes brackets, parenthesis and etc)
Plugin 'jiangmiao/auto-pairs'
" Adds support for GraphQL
Plugin 'jparise/vim-graphql'
call vundle#end()

filetype plugin indent on

" Setting the theme to dracula
syntax on
colorscheme dracula

"Set column to indicate the maximum line length
set cc=100
set textwidth=100

" SEARCH
" Highlight search term. Use :nohl to redraw screen and disable highlight
set hls
set number
nnoremap <leader><space> :noh<cr>

set gdefault
set incsearch
set showmatch
nnoremap <tab> %
vnoremap <tab> %

" Hotkey to reload .vimrc (leader + s)
nnoremap <leader>s :source $MYVIMRC<CR>
nnoremap <leader>es :vsplit $MYVIMRC<cr>

" MOVING BETWEEN FILES
" Set 'hidden' if you want to open a new file inside the same buffer without the
" need to save it first (if there's any unsaved changes).
set hidden

" BACKUP
" Disable all backup files, never used them
set nobackup
set nowritebackup
set noswapfile

" Number of commands that will be shown in history
set history=100

" AUTO IDENTATION - Enable auto identation with spaces instead of tabs
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set tabstop=2
filetype indent on
set nowrap
set expandtab

" Remove modelines
set modelines=0

" Enconding set to UTF-8
set encoding=utf-8

" Number of minimum available lines above and below the cursor to show some
" context
set scrolloff=5

set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)
set norelativenumber
set undofile
nnoremap / /\v
vnoremap / /\v

" Case insensitive for searches except when using capital letters
set ignorecase
set smartcase
set wrap
set formatoptions=qrn1
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j
set wildignore+=*/node_modules/*
vnoremap < <gv
vnoremap > >gv

"Highlight the cursorline
set cursorline

"Enable mouse for scrolling and resizing.
set mouse=a

" Set Title of the window
set title

" Set shortcut for nerdtree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeHijackNetrw=1
let g:NERDTreeWinSize=60

" Set shortcut for Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Set shortcut for Ack
nnoremap <leader>a :Ack 

" Configuration for Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'false'

"" Set specific linters
"let g:ale_linters = {
"\   'ruby': ['rubocop', 'reek'],
"\   'jsx': ['eslint'],
"\   'javascript': ['eslint']
"\}

"" Only run linters named in ale_linters settings.
"let g:ale_linters_explicit = 1 
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)
"let g:airline#extensions#ale#enabled = 1 
"let g:ale_sign_column_always = 1
"" Disable ALE auto highlights
"let g:ale_set_highlights = 0 

" Set shortcut to close split panels
map <leader>w :bd<CR>

runtime macros/matchit.vim
let g:ctrlp_show_hidden = 1

" Navigate through buffers
nnoremap <space> :bnext<cr>
nnoremap <bs> :bprev<cr>
nnoremap <leader>ls :ls<cr>:b<space>

" Copy and Paste to clipboard
noremap <leader>y "+y
vnoremap <leader>p "+p
nnoremap <leader>p "+p

" Exit highlighting when on insert mode after search
augroup highlight_search
  autocmd!
  autocmd InsertEnter * :setlocal nohlsearch
  autocmd InsertLeave * :setlocal hlsearch
augroup END
nnoremap <leader>/ :nohlsearch<cr>
