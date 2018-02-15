set nocompatible

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

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

set spell spelllang=en_ca

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
let g:ycm_confirm_extra_conf = 0
map <C-]> :YcmCompleter GoTo<CR>

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = "solarized"
let g:airline#extensions#tabline#enabled = 1

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" vim-clang-format
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1
let g:clang_format#auto_format_on_insert_leave = 1
let g:clang_format#auto_formatexpr = 1
