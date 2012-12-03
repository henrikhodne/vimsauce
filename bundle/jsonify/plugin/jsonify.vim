function! JSONify()
    1,$!node -e "eval('var data=' + require('fs').readFileSync('/dev/stdin', 'utf-8')); console.log(JSON.stringify(data, null, 4));"
    call JsBeautify()
endfunction
autocmd FileType javascript command! JSONify call JSONify()
