"  _   _                 _              ____             __ _
" | \ | | ___  _____   _(_)_ __ ___    / ___|___  _ __  / _(_) __ _
" |  \| |/ _ \/ _ \ \ / / | '_ ` _ \  | |   / _ \| '_ \| |_| |/ _` |
" | |\  |  __/ (_) \ V /| | | | | | | | |__| (_) | | | |  _| | (_| |
" |_| \_|\___|\___/ \_/ |_|_| |_| |_|  \____\___/|_| |_|_| |_|\__, |
"                                                             |___/

" jump to the last position when reopen file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" enabled true color for colorscheme
set termguicolors

" basic
set encoding=utf-8
set cursorline
set autoindent
set scrolloff=4

" indent width and type
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" line number
set number
set relativenumber

" search 
set incsearch
set hlsearch
set smartcase
set ignorecase

" special letter display
set showbreak=↪\
set listchars=eol:↩,trail:↩
"""""""""""""""""""""""
" KEY MAPPING SECTION "
"""""""""""""""""""""""

" quit highlight search
noremap <silent> <leader><CR> :nohlsearch<CR>

" copy to system clipboard
" noremap Y "+y

"        _             _
"  _ __ | |_   _  __ _(_)_ __
" | '_ \| | | | |/ _` | | '_ \
" | |_) | | |_| | (_| | | | | |
" | .__/|_|\__,_|\__, |_|_| |_|
" |_|            |___/
"
call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

Plug 'glepnir/zephyr-nvim'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

Plug 'glepnir/indent-guides.nvim'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/nvim-bufferline.lua'

Plug 'tpope/vim-surround'

call plug#end()

"""""""""""""""
" PLUG CONFIG "
"""""""""""""""
lua require('zephyr')

lua require("eviline")

let g:nvim_tree_indent_markers = 1

lua require("bufferline").setup{}
lua require('keymapping')

set completeopt=menuone,noselect

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

lua << EOF
require('lspconfig').tsserver.setup{}
EOF
