"                        _
"  _ __   ___  _____   _(_)_ __ ___
" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
" | | | |  __/ (_) \ V /| | | | | | |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|

scriptencoding utf-8

" Set up Plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'lilydjwg/colorizer'
Plug 'vim-scripts/CursorLineCurrentWindow'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 's3rvac/AutoFenc'
Plug 'tpope/vim-fugitive'
Plug 'exvim/ex-autocomplpop'
Plug 'tpope/vim-commentary'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'chrisbra/SudoEdit.vim'
Plug 'easymotion/vim-easymotion'
Plug 'lervag/vimtex'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'udalov/kotlin-vim'
Plug 'luochen1990/rainbow'

call plug#end()

" Fix missing python module errors when running in virtualenv
let g:python3_host_prog = '/usr/bin/python'

" Enable mouse
set mouse=a

" Enable true colors
set termguicolors

" Set theme
syntax on

set background=dark
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox

let g:airline_theme = 'gruvbox'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_powerline_fonts = 1

" Enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2

" Highlight current line
set cursorline

" Display line numbers
set number

" Do not show current mode on the last line
set noshowmode

" Disable timeout on escape
set ttimeoutlen=10

" Enable smart wrap
set wrap
set linebreak
set breakindent

" Expand tabs as n spaces
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Use X clipboard
set clipboard=unnamedplus

" Faster buffer manipulation
nnoremap <silent> <Tab> :bn<CR>:echo<CR>
nnoremap <silent> <S-Tab> :bp<CR>:echo<CR>
nnoremap <silent> <C-w> :bd<CR>:echo<CR>

" Hide current buffer when switching to another (to keep undo history)
set hidden

" Enable smartcase searching
set ignorecase
set smartcase

" Highlight search matches
set hlsearch

" Enable incremental search
set incsearch

" Space to turn off highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Save with C-s
map <C-s> :w<CR>

" Treat overflowing lines as having line breaks
map j gj
map k gk
map <down> gj
map <up> gk

set showbreak=↪\
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" BetterWhitespace:
" Strip trailing whitespaces on save
augroup whitespace
  autocmd BufEnter * EnableStripWhitespaceOnSave
augroup END

" AutoFenc:
" Set language for encoding autodetection
let g:autofenc_ext_prog_args = '-L czech -i'

" CtrlP:
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Hide .gitignore-d files
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif

" EasyMotion:
" Disable default mappings
let g:EasyMotion_do_mapping = 0

" Jump with `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Ale:
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-up> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-down> <Plug>(ale_next_wrap)

" Devicons:
let g:webdevicons_enable_airline_statusline = 0
let g:webdevicons_enable_airline_tabline = 0

" Rainbow:
let g:rainbow_active = 1
