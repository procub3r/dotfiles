set nocompatible

" My plugins:
call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'sainnhe/sonokai'
Plug 'itchyny/lightline.vim'
"Plug 'altercation/vim-colors-solarized'
call plug#end()

" My colours:

set termguicolors
let g:sonokai_enable_italic = 1
let g:sonokai_transparent_background = 1
let g:sonokai_style = 'atlantis'
let g:sonokai_better_performance = 1
colorscheme sonokai

let g:lightline = { 'colorscheme': 'sonokai' }

set noshowmode
set number
set mouse=a
set title
set cursorline
set relativenumber

" Tab settings:
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" NERDTree settings:
map <C-f> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Navigating buffers:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Helpful keybindings:
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
nnoremap \\ :noh<return>
nnoremap ;; :set invrelativenumber<return>
