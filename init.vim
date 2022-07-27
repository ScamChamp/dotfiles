:set number
:set autoindent
:set smarttab
:set mouse=a
:set cursorline
:set bufhidden=delete
set shell=/bin/bash

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/ap/vim-css-color'
Plug 'mcchrish/nnn.vim'
Plug 'https://github.com/vimoxide/vim-cinnabar'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/junegunn/rainbow_parentheses.vim'
call plug#end()
let g:airline_powerline_fonts = 1
nnoremap <leader>n :NnnPicker %:p:h<CR>u
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.7, 'highlight': 'Comment' } }

set termguicolors
colorscheme cinnabar
let g:airline_theme='simple'


