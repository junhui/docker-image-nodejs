set nocompatible              " be iMproved, required
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
 
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
 
Plugin 'scrooloose/nerdtree'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'scrooloose/syntastic'
Plugin 'Chiel92/vim-autoformat'
" Plugin 'mattn/emmet-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
 
set t_Co=256
let g:syntastic_javascript_checkers = ['jshint']
 
"set paste
set linespace=0
"set nobackup
"set noswapfile
set ignorecase
syntax enable
set number  
set wildmenu
set smartindent
set showmatch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set cindent
set autoindent
set smarttab
set expandtab
set backspace=indent,eol,start
set clipboard=unnamed
autocmd BufWritePre * :Autoformat
set relativenumber

autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

let mapleader=","
let maplocalleader=","

" YouCompleteMe {
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_filetype_blacklist = {}
let g:SuperTabDefaultCompletionType = '<C-n>'
" }

" UltiSnips {
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" }

set list listchars=tab:→\ ,trail:·
set backupdir=~/tmp

nnoremap <Leader>tt :NERDTreeToggle<CR>
