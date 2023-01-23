"syntax on

let g:indentLine_char = '|'
"filetype plugin indent on
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

" show line numbers
set number
" display relative line numbers
set relativenumber
" set the line number width from the left side of the terminal window
set numberwidth=10
" set the vim to a theme
"set background=dark
" enable tab menu. sort of like using the <c-d> when hitting tab command
set wildmenu
set tabstop=4
set shiftwidth=4
set incsearch
set ignorecase
set smartcase
set hlsearch
set noswapfile
set noerrorbells
" keep files open with out displaying them on the screen
set hidden

" Custom Maps

nnoremap <C-N> :bnext<CR> "when running this mapping, this shit
"is trying to open a new browser window
nnoremap <C-P> :bprev<CR>
nnoremap <C-N> :bnext<CR>

" Delete the entire line
map <c-d> dd
" Delete the current line, then paste it below the one we are one (move the
" line down one
map - ddp

" Import plugins
if filereadable(expand("~/.vimrc-plugins"))
        source ~/.vimrc-plugins
endif

" Status bar config
set statusline+=%#warningmsg#
set laststatus=2
set noshowmode

" Fix files automatically on save
let g:ale_fixers = {}
let g:ale_javascript_eslint_use_global = 1
let g:ale_linters = {
  \'javascript': ['eslint'],
\}

let g:ale_fixers = {
  \'javascript': ['prettier', 'eslint'],
\}

let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_fix_on_save = 1

" calls a function component which means the name of functions are registered.
" The function is called again and again so be careful not to register a heavy
" function. see help with ':h g:lightline.component_function'
let g:lightline = {
        \ 'colorscheme': 'rosepine',
        \ 'active': {
        \       'left': [ [ 'mode', 'paste' ],
        \                       [ 'readonly', 'filename', 'modified' ]],
        \},
        \'component_function': {
        \       'gitbranch': 'FugitiveHead()'
        \},
\}
