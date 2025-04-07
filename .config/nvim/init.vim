call plug#begin()

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jiangmiao/auto-pairs'
Plug 'charlespascoe/vim-go-syntax'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'

call plug#end()

set nu
set expandtab
set shiftwidth=4
set tabstop=4

hi! CocErrorSign guibg=#d1666a

" coc - bind coc-autocomplete to <TAB>
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

" coc - ignore new vertical error line
let b:coc_diagnostic_disable=0

" use catppuccin theme for lightline
let g:lightline = {'colorscheme': 'catppuccin'}
