" for long lines
set wrap

" tab business
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

" ditto
set autoindent

" syntax highlighting
syntax on

" no hl search
set nohlsearch

" try to detect filetypes
filetype on

" enable loading indent file for filetype
filetype plugin indent on

" line numbers
set number

" always show status
set laststatus=2

" enable mouse
set mouse=a

set statusline =
" Buffer number
set statusline +=[%n]
" File description
set statusline +=\ %f\ %h%m%r%w
" Filetype
set statusline +=%y
" Name of the current branch (needs fugitive.vim)
set statusline +=\ %{fugitive#statusline()}
" Total number of lines in the file
set statusline +=%=%-10L
" Line, column and percentage
set statusline +=%=%-14.(%l,%c%V%)\ %P

" syntastic
let g:syntastic_python_checkers = ['flake8', 'pyflakes']
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5

" default to passive and manual checks
let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': [ 'python', 'go' ] }

" make easy to perform a check (C-F6)
noremap <F30> :SyntasticCheck<CR>

"" vim-autoformat (C-F5)
noremap <F29> :Autoformat<CR>

" enable omnicompletion
set omnifunc=syntaxcomplete#Complete

call pathogen#infect()
call pathogen#helptags()

" looks nice; apparently needs to go after pathogen
set termguicolors
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

" EOL whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" for tmux, screen, etc
set t_ut=

" default is too slow
set updatetime=500

" re-read the file if changed (if possible)
set autoread
au CursorHold,CursorHoldI * checktime

" make easier to open NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

"" gen_tags.vim (reguires GNU global, aka gtags)
" disable ctags completely, use it through gtags plugin
let g:loaded_gentags#ctags = 1

" LSC conf

" Required for operations modifying multiple buffers like rename.
set hidden

let g:lsc_preview_split_direction = "below"

" dependent on gruvbox theme
highlight link lscDiagnosticError GruvboxRedSign
highlight link lscDiagnosticWarning GruvboxYellowSign

autocmd CompleteDone * silent! pclose

" add you lsc_server_commands and lsc_auto_map locally

