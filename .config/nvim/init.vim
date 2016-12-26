"                        _
"  _ __   ___  _____   _(_)_ __ ___
" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
" | | | |  __/ (_) \ V /| | | | | | |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|

" Set up Vundle
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'lilydjwg/colorizer'
Plugin 'vim-scripts/CursorLineCurrentWindow'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 's3rvac/AutoFenc'
Plugin 'tpope/vim-fugitive'
Plugin 'exvim/ex-autocomplpop'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-commentary'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'chrisbra/SudoEdit.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'Glench/Vim-Jinja2-Syntax'

call vundle#end()
filetype plugin indent on

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

" Enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2

" Highlight current line
set cursorline

" Display line numbers
set number

" Always show status line
set laststatus=2

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

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Project specific settings
au BufNewFile,BufRead /home/ondrej/Work/*.py setlocal noexpandtab tabstop=4 shiftwidth=4

" BetterWhitespace:
" Strip trailing whitespaces on save
autocmd BufWritePre * StripWhitespace

" AutoFenc:
" Set language for encoding autodetection
let g:autofenc_ext_prog_args = '-L czech -i'

" Syntastic:
let g:syntastic_python_flake8_args='--ignore=E122,W191,E501,E402'

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
