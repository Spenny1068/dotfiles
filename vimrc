syntax on
set number          " show line numbers
set relativenumber  " line numbers are relative
set hlsearch        " highlight searched word 
set incsearch       " highlight while typing
set shiftround      " round indents to multiple of shiftwidth
set tabstop=4       " spaces per tab
set softtabstop=4   " spaces per tab while editing
set shiftwidth=4    " spaces per shift
set expandtab       " tabs are spaces
set smartcase       " case-sensitive only when query contains uppercase letter
set linebreak       " avoid wrapping a line in the middle of a word
set ruler           " show column number bottom right
set noswapfile
set cursorline      " highlight the current line
set cindent
set autoindent
set noerrorbells    " disable beep on errors
set background=dark
set nobackup
set backspace=indent,eol,start

" key Mappings
let mapleader = " "
imap jj <Esc>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
inoremap {} {<CR>}<Esc>O

" required for vundle
set nocompatible
filetype off

" swift syntax highlighting
set rtp+=~/.vim/bundle/swift.vim

" setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" bundle Plugins
Plugin 'itchyny/lightline.vim'      " lightline
Plugin 'tpope/vim-surround'         " surround text
Plugin 'epmatsw/ag.vim'             " ag search
Plugin 'vimwiki/vimwiki'            " vimwiki
Plugin 'yggdroot/indentline'        " indentation lines
Plugin 'preservim/nerdtree'         " directory explorer
Plugin 'junegunn/fzf'               " file search
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-commentary'       " comments
Plugin 'gruvbox-community/gruvbox'  " colorscheme
Plugin 'neovimhaskell/haskell-vim'
Plugin 'Spenny1068/ciBracket'       " heh

call vundle#end()

filetype plugin indent on
colorscheme gruvbox

" lightline
set laststatus=2
let g:lightline = { 'colorscheme':'seoul256', }

" Ag
nnoremap <leader>s :Ag<space>
let g:ag_working_path_mode="r"

" fzf
nnoremap <leader>f :Files<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" NerdTree
nnoremap <Leader>pv :NERDTreeFind<CR> :vertical resize 30<CR>

" vim wiki"
let g:vimwiki_list = [{'path':'~/.vim/wiki'}]"
au FileType vimwiki setlocal shiftwidth=4 tabstop=4 expandtab
filetype off
filetype plugin on
syntax on

" Indentline
set conceallevel=1
let g:indentLine_conceallevel=1

" Haskell-vim
syntax on
filetype plugin indent on
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1
