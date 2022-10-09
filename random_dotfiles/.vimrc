"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|


syntax on
" ===========================================================================
" # Editor Settings
" ===========================================================================
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number          " line numbers
set relativenumber  " relative line numbers"
set nowrap
set smartcase
set noswapfile
set nobackup
set nocompatible
set undodir=~/.vim/undodir
set undofile
set incsearch
" set clipboard=unnamedplus
" set termguicolors
" For better display of messages
set cmdheight=2

filetype plugin on
filetype plugin indent on

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
" set nocompatible              " required
" syntax enable
" filetype indent on
" set autoindent
" filetype off                  " required

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
" set t_Co=256
" color wombat256mod

" hi CursorLineNR cterm=bold
" augroup CLNRSet
"     autocmd! ColorScheme * hi CursorLineNR cterm=bold
" augroup END


" ===========================================================================
" YCM (using vundle)
" ===========================================================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'wakatime/vim-wakatime'
call vundle#end()
filetype plugin indent on

