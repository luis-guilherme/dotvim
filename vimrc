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


" highlight end of line whitespace
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

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

" " spellcheck please!
setlocal spell spelllang=en_gb
hi clear SpellBad
hi SpellBad term=standout ctermfg=1 cterm=bold gui=undercurl guisp=Red

" extra python
"" wrapping and tabs
autocmd FileType python set ts=4 sw=4 et sta sts=4 ai
"" smart indenting
autocmd FileType python let python_highlight_all = 1
"" extra highlighting
autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" syntastic
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
let g:syntastic_scala_scalastyle_jar = '/home/juanmartinez/scala-local/lib/scalastyle_2.12-1.0.0-batch.jar'
let g:syntastic_scala_scalastyle_config_file = '/home/juanmartinez/scala-local/lib/scalastyle_config.xml'
let g:syntastic_scala_checkers = ['fsc', 'scalastyle']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5

"" default to passive and manual checks
let g:syntastic_mode_map = { 'mode': 'passive' }

" scala
let g:scala_scaladoc_indent = 1
noremap <C-F5> :Autoformat<CR>
let g:formatdef_scalariform = '"java -jar /home/juanmartinez/scalalocal/lib/scalariform.jar -f -q +compactControlReadability +alignParameters +alignSingleLineCaseStatements +doubleIndentConstructorArguments +rewriteArrowSymbols +preserveSpaceBeforeArguments --stdin --stdout"'
let g:formatters_scala = ['scalariform']

" use local tags if found
set tags=./.tags;
let g:easytags_dynamic_files = 1

" build tags
map <C-F12> :!ctags -R -f ./.tags .<CR>

call pathogen#infect()

" looks nice; apparently needs to go after pathogen
set background=dark
if has('gui_running')
	colorscheme base16-google-dark
else
	colorscheme torte
	set nospell
endif
let base16colorspace=256  " Access colors present in 256 colorspace
