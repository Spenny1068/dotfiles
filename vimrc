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
set linebreak       " avoid wrapping a line in the middle of a word
set ruler           " show column number bottom right
set noswapfile      " no swapfiles
set cursorline      " highlight the current line
set cindent
set autoindent      " try best to indent
set nobackup        " no backup files
set history=300     " vim history
set backspace=indent,eol,start
set background=dark
set smartcase       " case-sensitive only when query contains uppercase letter
set ignorecase
" set clipboard=unnamed " yank to system clipboard
" set wildignore=*.o,*.obj,*bak,*.exe
" set mouse=a
" set t_Co=256
" set noerrorbells    " disable beep on errors

if has('autocmd')
    filetype plugin indent on
endif

if &encoding ==# 'latin1' && has('gui_running')
    set encoding=utf-8
endif

" =========================== Key Mappings ===================================

let mapleader = " "
imap jj <Esc>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
inoremap {} {<CR>}<Esc>O
nnoremap <leader>e :tabedit<CR>
nnoremap <leader>ev :tabedit ~/.vimrc<CR>
nnoremap <leader>eb :tabedit ~/.bashrc<CR>
noremap <leader>y "*y
nnoremap <leader>cl :%s/\%x00//g<CR>
nnoremap <leader>cl2 :%s/\r//g<CR>
nnoremap <bs> <c-^>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap 'a 'azt
nnoremap 's 'szt
nnoremap 'd 'dzt
nnoremap 'f 'fzt
nnoremap } :keepjumps normal! }<cr>
nnoremap { :keepjumps normal! {<cr>
nnoremap ? :noh<CR><CR>

" tab instead of <C-n>
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" =========================== Functions ===================================
function! ClearTrailingSpace()
    call feedkeys(':%s/\s\+$//e', 't')
    call feedkeys("\<CR>")
endfunction

function! ClearRegisters()
    let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="*+'
    let i=0
    while (i<strlen(regs))
        exec 'let @'.regs[i].'=""'
        let i=i+1
    endwhile
endfunction

command! ClearTrailingSpace call ClearTrailingSpace()
command! ClearRegisters call ClearRegisters()

" =============================== Plugins ====================================

" required for vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

" bundle Plugins
call vundle#begin()
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
Plugin 'Spenny1068/ciBracket'       " woot
Plugin 'tpope/vim-obsession'        " vim sessions
Plugin 'qxxxb/vim-searchhi'         " highlight current search
" Plugin 'lervag/vimtex'              " LaTeX
" Plugin 'SirVer/ultisnips'           " snippets
call vundle#end()

" ===================== Plugin specific configurations =========================

colorscheme gruvbox

" lightline
set laststatus=2
let g:lightline = { 'colorscheme':'seoul256', }

" searchhi
nmap n <Plug>(searchhi-n)
nmap N <Plug>(searchhi-N)

" Ag
nnoremap <leader>s :Ag<space>
let g:ag_working_path_mode="r"

" fzf
nnoremap <leader>f :Files<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
" let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" vim wiki
let g:vimwiki_list = [{'path':'~/.vim/wiki'}]"
au FileType vimwiki setlocal shiftwidth=4 tabstop=4 expandtab
filetype off
syntax on

" NerdTree
nnoremap <Leader>pv :NERDTreeFind<CR> :vertical resize 30<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" Indentline
set conceallevel=1
let g:indentLine_conceallevel=1

" Obsession
nnoremap <leader>S :Obsess<CR>

" Ctags
" set tags=./tags;/
" map <leader>d <C-}>

" Vimtex
" highlight clear Conceal
" let g:tex_flavor='latex'
" let g:vimtex_complete_enabled=1
" let g:vimtex_view_method = 'skim'
" let g:vimtex_quickfix_mode=0
" let g:tex_conceal='abdmg'
" au BufEnter *.tex highlight clear Conceal

" Ultisnips
" let g:UltiSnipsExpandTrigger = '<s-tab>'

