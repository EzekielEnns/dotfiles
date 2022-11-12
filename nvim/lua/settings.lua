vim.cmd [[ 
    "colors and cursor 
        set encoding=UTF-8
        set background=dark
        set termguicolors
        set guicursor=
        set cmdheight=1

    "utils and special features 
        set splitbelow
        set splitright
        set mouse+=a 
        set clipboard=unnamedplus
        set encoding=utf-8
        set hidden 
        set noerrorbells
        set noswapfile
        set nobackup
        set undodir=~/.vim/undodir
        set undofile
        set shortmess+=c

    "columns and numbers 
        set nowrap
        set signcolumn=yes
        set number
        set relativenumber
        set ruler  
        set scrolloff=13
        set colorcolumn=100

    "indenting
        set autoindent 
        set smartindent
        set tabstop=4 softtabstop=4
        set shiftwidth=4
        set expandtab 
        set foldmethod=indent

    "searching 
        set nohlsearch
        set incsearch
]]
