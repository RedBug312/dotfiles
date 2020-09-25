if &compatible
    set nocompatible
endif

" SOURCES
let g:python3_host_prog = '/usr/bin/python3'
source ~/.config/nvim/config/plugins.vim
source ~/.config/nvim/config/mappings.vim

" FEATURES
set foldlevelstart=99
set foldmethod=syntax
set formatoptions+=nBj
set path+=**
set spelllang=en_us,cjk
set splitright

" INDENTS
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" SEARCHING
set ignorecase
set smartcase
set incsearch
set hlsearch

" LOOKINGS
" set filetype=markdown
set background=dark
set completeopt-=preview
set fillchars=fold:\ ,vert:│
" set foldtext='☰\ '.getline(v:foldstart)
set noshowmode
set list
set listchars=tab:»\ ,trail:·
set number
set relativenumber
set printfont=:h8
" let &showbreak='⮡ '

" FILETYPE-SPECIFIC
" autocmd BufEnter * if @% == '' | setlocal filetype=markdown | endif
autocmd FileType gitcommit setlocal spell tw=72 fo+=t
autocmd FileType markdown  setlocal spell cms=<!--%s-->
autocmd FileType gnuplot   setlocal cms=#%s

colorscheme plain
