set nocompatible
filetype plugin on
let &shm = 'I'
let &encoding = 'utf-8'
set hidden

" {{ keyboard behaviour
inoremap kj <esc>
map <C-n> :NERDTreeToggle<CR>
map <C-b> :BuffergatorToggle<CR>
" }}

" {{ appearance
set visualbell
set t_vb=

syntax on

hi clear SpellBad
hi SpellBad cterm=bold ctermbg=darkred ctermfg=white

let g:Powerline_symbols = 'fancy'
let &laststatus = 2

source ~/.configs/theme/vimrc

let g:no_rust_conceal = 1
" }}

" {{ formatting
" default indentation settings
let g:indent = 2
let &tabstop = indent
let &softtabstop = indent
let &shiftwidth = indent
set autoindent
set smartindent
set expandtab

let g:jsbeautify = {'indent_size': indent, 'indent_char': ' ', 'max_char': 78, 'brace_style': 'end-expand'}

" guess indentation settings on file load
autocmd BufReadPost * :GuessIndent

" for specific filetypes
au BufNewFile,BufRead *.md setf markdown
au BufNewFile,BufRead *.cs setf coffee
au BufNewFile,BufRead *.escad,*.scad setf javascript
au BufNewFile,BufRead *.pde,*.ino setf cpp

" for autoformatting
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType html let b:closetag_html_style = 1
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" for autocompiling
autocmd FileType rust autocmd BufWritePost <buffer> silent make %:r|redraw!|cc
" }}

" various loose settings
let g:gist_detect_filetype = 1
let g:SuperTabDefaultCompletionType = "context"
let g:session_autosave = 'yes'

" load plugins
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

" activate theme
colorscheme solarized
