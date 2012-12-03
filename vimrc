set nocompatible
filetype plugin on

" {{ appearance
syntax on

hi clear SpellBad
hi SpellBad cterm=bold ctermbg=darkred ctermfg=white

let g:Powerline_symbols = 'fancy'
let &laststatus = 2

let &background = 'dark'
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
let g:solarized_contrast = "high"
let g:solarized_visibility = "high"
" }}

" {{ formatting
" default indentation settings
let g:indent = 4
let &tabstop = indent
let &softtabstop = indent
let &shiftwidth = indent
set expandtab

let g:jsbeautify = {'indent_size': indent, 'indent_char': ' ', 'max_char': 78, 'brace_style': 'end-expand'}

" guess indentation settings on file load
autocmd BufReadPost * :GuessIndent

" for specific filetypes
au BufNewFile,BufRead *.escad,*.scad setf javascript
au BufNewFile,BufRead *.pde,*.ino setf cpp

"for autoformatting
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType html let b:closetag_html_style = 1
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" }}

" various loose settings
let g:gist_detect_filetype = 1
let g:SuperTabDefaultCompletionType = "context"
let g:session_autosave = 'yes'

"load plugins
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

" activate theme
colorscheme solarized
