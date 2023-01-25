function! dev#filetype#filetype_auto_start() abort
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
endfunction
