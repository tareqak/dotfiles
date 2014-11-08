set nocompatible
filetype off
filetype plugin indent off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'godlygeek/tabular'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'mhinz/vim-signify'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'wincent/Command-T'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Raimondi/delimitMate'
Bundle 'Valloric/YouCompleteMe'

syntax on
filetype plugin indent on

" Highlight extra (leading or trailing) whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

set t_Co=256
set background=dark
colorscheme solarized

au BufNewFile * set fileformat=unix encoding=utf-8

autocmd FileType go autocmd BufWritePre <buffer> Fmt

set backspace=indent,eol,start
set shell=/usr/local/bin/zsh

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

set sts=2
set sw=2
set expandtab
set wrap
set textwidth=79
set colorcolumn=80
set number

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

nmap <silent> <S-Up> :wincmd k<CR>
nmap <silent> <S-Down> :wincmd j<CR>
nmap <silent> <S-Left> :wincmd h<CR>
nmap <silent> <S-Right> :wincmd l<CR>

" Disable arrow keys in vim
"noremap  <Up> ""
"noremap! <Up> <Esc>
"noremap  <Down> ""
"noremap! <Down> <Esc>
"noremap  <Left> ""
"noremap! <Left> <Esc>
"noremap  <Right> ""
"noremap! <Right> <Esc>

set clipboard=unnamed

"nmap <F8> :TagbarToggle<CR>

nnoremap <leader>a= :Tabularize /=<CR>
vnoremap <leader>a= :Tabularize /=<CR>
nnoremap <leader>a: :Tabularize /:\zs<CR>
vnoremap <leader>a: :Tabularize /:\zs<CR>

map <leader>n <plug>NERDTreeTabsToggle<CR>

let g:syntastic_auto_loc_list       = 1
let g:syntastic_check_on_open       = 1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_tex_checkers = ['chktex']
"let g:syntastic_cpp_checkers = ['ycm']
"let g:syntastic_c_checkers = ['ycm']

let g:nerdtree_tabs_open_on_gui_startup = 0

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1  = "inc"

"let g:nodejs_complete_config = {'max_node_compl_len': 100,}

"let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf                  = 0

let g:airline_powerline_fonts = 1
let g:airline_theme = "solarized"
let g:airline#extensions#tabline#enabled = 1

let g:CommandTMaxHeight = 15
