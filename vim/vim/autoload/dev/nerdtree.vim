function! dev#nerdtree#NERDTree_auto_start() abort 
  " Open NERDTree buffer when executing vim
  autocmd VimEnter * NERDTree | wincmd p
  " Close NERDTree if it is the last open buffer
  autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
  " Intialize the mappings here 
  call s:NERDTree_Maps() 
endfunction 

function! s:CloseIfOnlyNerdTreeLeft() abort
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q " vim for quit
      endif
    endif
  endif
endfunction

function! s:NERDTree_Maps() abort
  nnoremap <leader>n :NERDTreeFocus<CR>
  
  " Disallow NERDTree from remapping Ctr-J/K. This was conflicting with tmux/vim 
  " split navigation.
  let g:NERDTreeMapJumpNextSibling = '<Nop>'
  let g:NERDTreeMapJumpPrevSibling = '<Nop>'
endfunction
