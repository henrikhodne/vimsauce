function! Decafe()
    1,$!coffee -spb
    setf javascript
endfunction
autocmd FileType coffee command! Decafe call Decafe()
