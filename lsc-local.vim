"
" Exampke of local configuration
"
let g:lsc_server_commands = {
 \ 'python': {
 \     'command': 'pyls',
 \     'message_hooks': {
 \         'initialize': {
 \             'initializationOptions': {
 \                 "pyls.plugins.pydocstyle.enabled": 1,
 \                 "pyls.plugins.epyls_mypy.enabled": 1,
 \                 "pyls.plugins.epyls_mypy.live_mode": 0
 \             }
 \         }
 \     }
 \  },
 \ 'scala' : 'metals-vim',
 \ 'haskell' : 'haskell-language-server-wrapper --lsp'
 \ }

" for mill build.sc
autocmd BufNewFile,BufRead *.sc set filetype=scala
