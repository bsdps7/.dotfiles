""" Plugins
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'dylanaraps/wal.vim'

"Plug 'junegunn/seoul256.vim'
"Plug 'itchyny/lightline.vim'

"Plug 'jiangmiao/auto-pairs'
"
"Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'
"
"Plug 'sheerun/vim-polyglot'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set nocompatible

syntax on
filetype indent plugin on

""" Theme

set background=dark
"set termguicolors
colorscheme wal
"let g:seoul256_background=234
"colo seoul256
"
"highlight LineNr ctermbg=NONE guibg=NONE
"highlight CursorLineNr ctermbg=NONE guibg=NONE
highlight Comment cterm=italic gui=italic

""" Status Line

set laststatus=2 "display status line always

highlight StatusLine ctermfg=NONE ctermbg=red cterm=NONE
highlight StatusLineNC ctermfg=black ctermbg=red cterm=NONE
highlight User1 ctermfg=black ctermbg=magenta
highlight User2 ctermfg=NONE ctermbg=NONE
highlight User3 ctermfg=black ctermbg=blue
highlight User4 ctermfg=black ctermbg=cyan
set statusline=\                    " Padding
set statusline+=%f                  " Path to the file
set statusline+=\ %1*\              " Padding & switch colour
set statusline+=%y                  " File type
set statusline+=\ %2*\              " Padding & switch colour
set statusline+=%=                  " Switch to right-side
set statusline+=\ %3*\              " Padding & switch colour
set statusline+=line                " of Text
set statusline+=\                   " Padding
set statusline+=%l                  " Current line
set statusline+=\ %4*\              " Padding & switch colour
set statusline+=of                  " of Text
set statusline+=\                   " Padding
set statusline+=%L                 " Total line
set statusline+=\                   " Padding 

""" Basic Options

set path+=** "allow recursive file search
set wildmenu "command-line completion
set wildignore+=*/.git/*
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.png,*.pdf,*.gif

set showcmd
set hidden
set autochdir "automatically change current workng directory
set noshowmode

set ruler
set number relativenumber

set nohlsearch
set incsearch "incremental search
set ignorecase smartcase "case-insensitive search except if using capital letters

set backspace=indent,eol,start "allow backspacing over autoindent, line break, start of insert
set mouse=a

set notimeout ttimeout ttimeoutlen=100 "quick timeout on keycodes but never on mappings

""" Backup Options

set nobackup
set nowritebackup
set noswapfile

set undofile "persistent undo

""" Indent Options

set expandtab
set shiftwidth=2
set softtabstop=2

""" Netrw

let g:netrw_winsize=24
let g:netrw_banner=0
let g:netrw_liststyle=3 "tree style listing
let g:netrw_sort_sequence='[\/]$,*' "sort directories first
let g:netrw_browse_split=4
let g:netrw_altv=1

""" Mappings

map Y y$
nnoremap <C-I> :Lexplore<CR>
