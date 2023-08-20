call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'catppuccin/vim', { 'as': 'catppuccin' }

Plug 'itchyny/lightline.vim'

Plug 'dylanaraps/wal'


call plug#end()

set termguicolors
set number
syntax enable
filetype detect
" let g:lightline = {'colorscheme': 'catppuccin_mocha'}
" colorscheme catppuccin_mocha
colorscheme wal
