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

" enable mouse
set mouse=a

" set term title
set title
set titleold=

" plugin dependent conf starts

call plug#begin('~/.vim/plugged')

" git
Plug 'tpope/vim-fugitive', { 'tag': 'v3.2' }
Plug 'airblade/vim-gitgutter'

" tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'wincent/terminus'

" life improvements
Plug 'gruvbox-community/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'qpkorr/vim-bufkill'
Plug 'Chiel92/vim-autoformat'
Plug 'jsfaint/gen_tags.vim'
Plug 'rbong/vim-crystalline'
Plug 'godlygeek/tabular'

" language support
Plug 'fatih/vim-go'
Plug 'natebosch/vim-lsc'
Plug 'samsaga2/vim-z80'
Plug 'tomtom/tcomment_vim'
Plug 'liuchengxu/vista.vim'

call plug#end()

function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  endif
  let l:s .= '%#Crystalline# %<%f%h%w%m%r %{fugitive#statusline()}'

  let l:s .= '%='
  if a:current
    let l:s .= ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
    let l:s .= crystalline#left_mode_sep('')
  endif
  if a:width > 80
    let l:s .= ' %{&ft} [%{&fenc!=#""?&fenc:&enc}][%{&ff}] %3(%c%V%) %l/%L %P '
  else
    let l:s .= ' '
  endif

  return l:s
endfunction

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'gruvbox'

set laststatus=2

"" vim-autoformat (C-F5)
noremap <F29> :Autoformat<CR>
au BufWrite *.py,*.c,*.h :Autoformat

" enable omnicompletion
set omnifunc=syntaxcomplete#Complete

" looks nice
set termguicolors
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_guisp_fallback = "fg"

" toggle spell check
map <leader>s :set spell! spelllang=en_gb<CR>

" some types that shouldn't have spell check on
autocmd FileType json setlocal nospell
autocmd FileType conf setlocal nospell
autocmd FileType xml setlocal nospell

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
map <leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

"" gen_tags.vim (reguires GNU global, aka gtags)
" disable ctags completely, use it through gtags plugin
let g:loaded_gentags#ctags = 1

" LSC conf
"
let g:lsc_auto_map = {'defaults': v:true, 'FindImplementations': ''}

" Required for operations modifying multiple buffers like rename.
set hidden

" better for some messages
set cmdheight=2
set shortmess+=c
" for lsc erros
set shortmess-=F

let g:lsc_preview_split_direction = "below"

" disable preview when doing auto-complete
set completeopt-=preview

" dependent on gruvbox theme
highlight link lscDiagnosticError GruvboxRedSign
highlight link lscDiagnosticWarning GruvboxYellowSign

" add you lsc_server_commands and lsc_auto_map locally

" vista
let g:vista_default_executive = 'vim_lsc'

