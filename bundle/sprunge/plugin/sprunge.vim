function! Sprunge()
    w !curl -F 'sprunge=<-' sprunge.us
endfunction
command! Sprunge call Sprunge()

