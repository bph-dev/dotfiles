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
