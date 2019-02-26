" for long lines
set wrap

" tab position
set tabstop=4

set autoindent

" autotab
set shiftwidth=4

" syntax highlighting
syntax on

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

" extra C
autocmd FileType c setl ts=4

" syntastic
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5

" default to passive and manual checks
let g:syntastic_mode_map = { 'mode': 'passive' }

" make easy to perform a check
noremap <C-F6> :SyntasticCheck<CR>

"" vim-autoformat
noremap <C-F5> :Autoformat<CR>

" use local tags if found
set tags=./.tags;
let g:easytags_dynamic_files = 1

" build tags
map <C-F12> :!ctags -R -f ./.tags .<CR>

" enable omnicompletion
set omnifunc=syntaxcomplete#Complete

call pathogen#infect()
call pathogen#helptags()

" looks nice; apparently needs to go after pathogen
set termguicolors
set background=dark
colorscheme base16-monokai

" for tmux, screen, etc
set t_ut=

" default is too slow
set updatetime=200

" make easier to open NERDTree
map <C-n> :NERDTreeToggle<CR>

" highlight end of line whitespace
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

