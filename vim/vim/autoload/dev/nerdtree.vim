function! dev#nerdtree#nerdtree_auto_start() abort 
  autocmd VimEnter * NERDTree | wincmd p
  call s:NerdTree_Maps() 
endfunction 

function! s:NerdTree_Maps() abort
  nnoremap <leader>n :NERDTreeFocus<CR>
endfunction
