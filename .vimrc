call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'preservim/nerdcommenter'
call plug#end()
colorscheme dracula

filetype plugin on

" NERDCommenter settings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Basic settings
"
" <ESC> is hard to reach so map jk to <ESC>
" Also, if I'm in insert mode, hit jk, and hit <i>,
" I want to be in the same position; hence the extra <l>.
inoremap jk <ESC>l
noremap jk <ESC>

" Easily escape and save from within insert mode
inoremap wq <ESC>:w<Return>l

let mapleader=","
set timeoutlen=500
syntax on
set nocompatible
set encoding=utf-8
set nu
set showcmd
set cursorline
set backspace=indent,eol,start
" Show existing tab with 4 spaces width
set softtabstop=4 expandtab
" When indenting with '>', use 4 spaces width
set shiftwidth=4

" k/j to move through lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap gj j
vnoremap gk k

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Insert newline by Enter
nmap <CR> o<Esc>
