set nocompatible

syntax on
filetype plugin indent on

" Highlight extra (leading or trailing) whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

set t_Co=256
set background=dark
packadd! onedark.vim
colorscheme onedark

au BufNewFile * set fileformat=unix encoding=utf-8

set backspace=indent,eol,start

" set hidden
set switchbuf=usetab,newtab

" Turn on incremental search and search highlighting
set incsearch
set hlsearch

" Row and column at the bottom right
set ruler

" Last command or selection range
set showcmd

set cursorline
set history=1000
set shortmess=I
set ttyfast
set cursorline
set mouse=a

set sts=4
set sw=4
set expandtab
set wrap
set textwidth=79
set colorcolumn=80
set number

if has('mouse_sgr')
    set ttymouse=sgr
endif

autocmd BufEnter * sign define dm
autocmd BufEnter * execute 'sign place 9999 line=1 name=dm buffer=' . bufnr('')

set wildmode=longest:full
set wildmenu

let mapleader = " "

" Y now copies everything up to the end of the line
nmap Y y$

" Undo, backup, and swap directories and parameters
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backup
set undofile
set undoreload=10000

set spell spelllang=en_us

nmap <silent> <S-Up> :wincmd k<CR>
nmap <silent> <S-Down> :wincmd j<CR>
nmap <silent> <S-Left> :wincmd h<CR>
nmap <silent> <S-Right> :wincmd l<CR>

set clipboard=unnamed

set tabpagemax=100

nmap <F8> :TagbarToggle<CR>

" Tabularize
nnoremap <leader>a= :Tabularize /=<CR>
vnoremap <leader>a= :Tabularize /=<CR>
nnoremap <leader>a: :Tabularize /:\zs<CR>
vnoremap <leader>a: :Tabularize /:\zs<CR>

" Syntastic
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_tex_checkers = ['chktex']

" YCM

" Airline
set laststatus=2
let g:airline_powerline_fonts = 0
let g:airline_theme = "onedark"
let g:airline#extensions#tabline#enabled = 1

