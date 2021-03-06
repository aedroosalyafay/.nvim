
set nocompatible
filetype off

" Plugins
"------------------
call plug#begin("~/.config/nvim/bundle")
Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'airblade/vim-gitgutter'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
"Plug 'rust-lang/rust.vim'
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"  Plug 'zchee/deoplete-go', { 'do': 'make'}
"endif
call plug#end()

"if has('nvim')
"  " Enable deoplete on startup
"  let g:deoplete#enable_at_startup = 1
"endif

" General
"-------------------

" UI
"-------------------
if !exists("g:vimrc_loaded")
  if exists('+colorcolumn')
    set colorcolumn=80
  endif

" Vim color detection
  if $COLORTERM == 'gnome-terminal'
    set t_Co=256
  endif
  let g:rehash256 = 1

  colorscheme molokai
  "let g:molokai_original = 1
endif

if has('mouse')
  set mouse=a
  set selectmode=mouse,key
  set nomousehide
endif

syntax on
filetype on
filetype plugin on
filetype indent on

set relativenumber
set number

set wrap linebreak
set shiftwidth=4 tabstop=4
let mapleader=","
set hlsearch
set mouse=a

"" <TAB>: completion.
"set completeopt=menu
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

set directory=~/.vim/.swapfiles//

if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif

set backspace=indent,eol,start

" Source Plugins
"------------------
source ~/.config/nvim/config/ctrlp.vim
source ~/.config/nvim/config/vim-go.vim
source ~/.config/nvim/config/gitgutter.vim
source ~/.config/nvim/config/markdown.vim
source ~/.config/nvim/config/airline.vim
source ~/.config/nvim/config/ale.vim

" Key bindings
"------------------
nmap <F12> :set paste!<CR>

" Add META(Alt)+i as escape trigger
inoremap jj <esc>

" Add alias for command in new window/buffer
:command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

" Load local config if exists
if filereadable(expand("~/.config/nvim/config/local.vim"))
  source ~/.config/nvim/config/local.vim
endif

" Disable deoplete when in multi cursor mode
" https://hackernoon.com/my-neovim-setup-for-go-7f7b6e805876
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction
function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction
