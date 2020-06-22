syntax on
set number          " show line numbers
set relativenumber
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

" colorschemes
colorscheme gruvbox
""colorscheme stellarized

" key Mappings
let mapleader = " "
imap jj <Esc>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" ,. to run program
map ,. :call RunProgram()<CR>
func! RunProgram()
    if (&ft=='cpp' || &ft=='c')
        :!make
    elseif (&ft=='python')
        :!python3 %
    elseif (&ft=='sh')
        :!sh %
    elseif (&ft=='perl')
        :!perl %
    endif
endfunc

set nocompatible
filetype off

" swift syntax highlighting
set rtp+=~/.vim/bundle/swift.vim

" setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" bundle Plugins
Plugin 'neoclide/coc.nvim'
Plugin 'itchyny/lightline.vim'  " lightline
Plugin 'tpope/vim-surround'     " surround text
Plugin 'epmatsw/ag.vim'         " ag search
Plugin 'vimwiki/vimwiki'        " vimwiki
Plugin 'yggdroot/indentline'    " indentation lines
Plugin 'preservim/nerdtree'     " directory explorer
Plugin 'junegunn/fzf'           " file search
Plugin 'junegunn/fzf.vim'

call vundle#end()
filetype plugin indent on

" lightline
set laststatus=2
let g:lightline = { 'colorscheme':'seoul256', }

" Ag
nnoremap <leader>s :Ag<space>
let g:ag_working_path_mode="r"

" FZF
nnoremap <leader>f :Files<CR>

" NerdTree
nnoremap <Leader>pv :NERDTreeFind<CR> :vertical resize 30<CR>

" vim wiki"
let g:vimwiki_list = [{'path': '~/.vim/wiki/', 'syntax': 'markdown'}]
au FileType vimwiki setlocal shiftwidth=4 tabstop=4 expandtab

" Indentline
set conceallevel=1
let g:indentLine_conceallevel=1

" Coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>y <Plug>(coc-type-definition)
nmap <silent> <leader>i <Plug>(coc-implementation)
nmap <silent> <leader>r <Plug>(coc-references)

