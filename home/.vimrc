call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'catppuccin/vim', { 'as': 'catppuccin' }

call plug#end()

set termguicolors
set number
syntax enable
filetype detect
colorscheme catppuccin_mocha
