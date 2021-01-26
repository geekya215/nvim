"  _   _                 _              ____             __ _
" | \ | | ___  _____   _(_)_ __ ___    / ___|___  _ __  / _(_) __ _
" |  \| |/ _ \/ _ \ \ / / | '_ ` _ \  | |   / _ \| '_ \| |_| |/ _` |
" | |\  |  __/ (_) \ V /| | | | | | | | |__| (_) | | | |  _| | (_| |
" |_| \_|\___|\___/ \_/ |_|_| |_| |_|  \____\___/|_| |_|_| |_|\__, |
"                                                             |___/

" enable syntax highlight
if has("syntax")
  syntax on
endif

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

" indent witdh and type
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
set listchars=eol=↩

"""""""""""""""""""""""
" KEY MAPPING SECTION "
"""""""""""""""""""""""

" leader key
let mapleader=" "

noremap ; :

" save, quit, and reload
noremap S :w<CR>
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap R :source ~/.config/nvim/init.vim<CR>

" window split
noremap <leader>s :vs<CR>
noremap <leader>h <C-w>h
noremap <leader>l <C-w>l
map <leader><left> :vertical resize-5<CR>
map <leader><right> :vertical resize+5<CR>

" tab
noremap <leader>t :tabe<CR>
noremap <leader>j :-tabnext<CR>
noremap <leader>k :+tabnext<CR>
noremap <leader>mj :-tabmove<CR>
noremap <leader>mk :+tabmove<CR>

" simplify indent
noremap > >>
noremap < <<

" move
noremap J 5j
noremap K 5k

" quit highlight search
nore <leader><CR> :nohlsearch<CR>

" copy to system clipboard
noremap Y "+y

" compile and run cpp program
autocmd TermOpen term://* startinsert

noremap <F9> :call Compile()<CR>
noremap <F10> :call Run()<CR>

func! Compile()
  exec "w"
  exec "!g++ % -std=c++11 -O2 -o %<"
endfunc

func! Run()
  exec "vs"
  exec "terminal time ./%<"
endfunc

"        _             _
"  _ __ | |_   _  __ _(_)_ __
" | '_ \| | | | |/ _` | | '_ \
" | |_) | | |_| | (_| | | | | |
" | .__/|_|\__,_|\__, |_|_| |_|
" |_|            |___/
"
call plug#begin('~/.vim/plugged')
" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" color scheme
Plug 'glepnir/oceanic-material'

" ui
Plug 'glepnir/dashboard-nvim'
Plug 'liuchengxu/vim-clap'
Plug 'glepnir/spaceline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'mg979/vim-xtabline'
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-gitgutter'

" edit
Plug 'tpope/vim-surround'

" other
Plug 'liuchengxu/vim-which-key'
Plug 'voldikss/vim-floaterm'
call plug#end()

"""""""""""""""
" PLUG CONFIG "
"""""""""""""""

" color scheme
colorscheme oceanic_material
let g:oceanic_material_background = 'darker'

" dashboard
let g:dashboard_default_executive = 'clap'
let g:dashboard_custom_header = 'commicgirl9'
nmap <leader>ss :<C-u>SessionSave<CR>
nmap <leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <leader>ff :DashboardFindFile<CR>
nnoremap <silent> <leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <leader>fa :DashboardFindWord<CR>
nnoremap <silent> <leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <leader>cn :DashboardNewFile<CR>

" spaceline
let g:spaceline_seperate_style = 'none'
let g:spaceline_colorscheme = 'space'

" indentLine
let g:indentLine_fileTypeExclude = ['coc-explorer', 'dashboard']

" rainbow
let g:rainbow_active = 1

" which key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" FloatTerm 
nnoremap <silent> <leader>g :FloatermNew --height=0.8 --width=0.8 --autoclose=2 lazygit<CR>
tnoremap <silent> <F5> <C-\><C-n>:FloatermKill<CR>
nnoremap <silent> <F6> :FloatermNew<CR>
tnoremap <silent> <F6> <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <F7> :FloatermPrev<CR>
tnoremap <silent> <F7> <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <F8> :FloatermNext<CR>
tnoremap <silent> <F8> <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>

" Coc
let let g:coc_global_extensions = [
  \'coc-tsserver',
  \'coc-json',
  \'coc-html',
  \'coc-emmet',
  \'coc-prettier',
  \'coc-eslint',
  \'coc-snippets',
  \'coc-explorer',
  \'coc-pairs'
]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>f :Prettier<CR>

" Open explorer
nmap <silent> <leader>e :CocCommand explorer<CR>

