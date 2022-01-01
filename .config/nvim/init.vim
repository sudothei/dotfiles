"Plugins used:
    "NERDcommenter (for bulk commenting)
    "MatchTagAlways (for highlighting HTML tag pairs)
    "indentLine (for pretty vertical indent lines)
    "auto-pairs (for automatching pairs)
    "vim-surround (for editing surrounding character pairs)
    "coc.vim (for spellcheck and completion)

"UI Colors
hi clear SignColumn
hi CocErrorFloat ctermfg=0
hi CocWarningFloat ctermfg=0
hi CocInfoFloat ctermfg=0
hi CocErrorVirtualText ctermfg=3
hi CocWarningVirtualText ctermfg=3
hi CocInfoVirtualText ctermfg=3
hi Comment ctermfg=1

"Leader key used for plugins
let mapleader =","

" #########################################
" # Bad habit fixer
" #########################################
nnoremap <Left>  <Nop>
nnoremap <Right> <Nop>
nnoremap <Up>    <Nop>
nnoremap <Down>  <Nop>
vnoremap <Left>  <Nop>
vnoremap <Right> <Nop>
vnoremap <Up>    <Nop>
vnoremap <Down>  <Nop>
" #########################################
" # Bad habit fixer
" #########################################

" Hover documentation
nmap <leader> h :call CocAction("doHover", ["preview"])<CR>

" CoC Keybinds
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references-used)

" open terminal on ctrl+n
function! OpenTerminal()
  vsplit term://zsh
  vertical resize 80
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

"Shortcut for find next & replace
nnoremap <space><space> cgn

"For clipboard
set clipboard+=unnamedplus
nnoremap X "_X
nnoremap C "_C
nnoremap S "_S
nnoremap x "_x
nnoremap c "_c
vnoremap c "_c
vnoremap s "_s

"Don't conceal JSON quotes
autocmd Filetype json
  \ let g:indentLine_setConceal = 0 |
  \ let g:vim_json_syntax_conceal = 0

"Allow mouse navigation
set mouse=a            

"Bypasses prompts that require pressing enter
set shortmess+=c

"Disables swapfiles (can be dangerous)
"set noswapfile

"For gutter
set number relativenumber
set numberwidth=3
set signcolumn=yes:1

set ttimeout		
set ttimeoutlen=100	
set updatetime=300

"Highlights matching braces
set showmatch          

"Ignores save reminders
set hidden

"For indentation
set expandtab
set shiftwidth=4
set softtabstop=4

"For fuzzy file management
set display=truncate
set path+=**
set conceallevel=0

"For syntax highlighting
syntax on
filetype plugin indent on

let g:AutoPairsMultilineClose = 0 

" Fold by indent, then set foldmethod to manual on open"
set foldnestmax=5
augroup foldstuff
    autocmd!
    autocmd BufEnter * setlocal foldmethod=indent
    autocmd BufEnter * normal zR
    autocmd BufEnter * setlocal foldmethod=manual
augroup END

" Press leader+f to toggle folds"
inoremap <leader>f <C-O>za
nnoremap <leader>f za
onoremap <leader>f <C-C>za
vnoremap <leader>f zf

" clears search highlighting until next search
nnoremap <C-L> :nohl<cr>:<backspace>

" Do incremental searching when it's possible to timeout.
if has('reltime')
    set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal
" Don't usetEx mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  UseCTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>
 
 " Prettier stuff
 " nnoremap <leader>P :CocCommand prettier.formatFile

 " VimTex stuff
let g:tex_flavor='latex'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}

autocmd FileType tex VimtexCompile

 " Instant markdown stuff
filetype plugin on
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1
