" for long lines
set wrap

" tab business
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent

" syntax highlighting
syntax on

set nohlsearch

" try to detect filetypes
filetype on

" enable loading indent file for filetype
filetype plugin indent on

" line numbers
set number

" cursor line
set cursorline

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
Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'

" language support
Plug 'fatih/vim-go'
Plug 'natebosch/vim-lsc'
Plug 'samsaga2/vim-z80'
Plug 'tomtom/tcomment_vim'
Plug 'liuchengxu/vista.vim'
Plug 'https://tildegit.org/sloum/gemini-vim-syntax.git'

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
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = "medium"
let g:gruvbox_guisp_fallback = "fg"

" toggle spell check
map <leader>s :set spell! spelllang=en_gb<CR>

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
let g:vista_default_executive = 'ctags'

let g:vista_executive_for = {
  \ 'scala': 'vim_lsc',
  \ 'python': 'vim_lsc',
  \ }

" vimwiki
let g:vimwiki_list = [{'path': '~/textfiles/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal_code_blocks = 0
autocmd FileType markdown setlocal conceallevel=2

