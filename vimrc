"""""""""""""""""""""""""""""
" => Setup pathogen plugin  "
"""""""""""""""""""""""""""""
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => General                                                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set to be non-compatible to vi
set nocompatible

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
if has ("autocmd")
  filetype plugin indent on
endif


" Set to auto read when a file is changed from the outside
set autoread

" Map leader to space bar
let mapleader = "\<space>"
let g:mapleader = "\<space>"

" Fast saving
nmap <leader>w :w!<cr>

" Set central location for vim temporary files
set backupdir=~/tmp
set directory=~/tmp

"""""""""""""""""""""""""""
"  => VIM user interface  "
"""""""""""""""""""""""""""

" When searching for text centre the found line in the middle of the screen
set so=5

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show the ruler
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace and wrapping
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Regular expressions
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How long to show for in tenths of a second
set mat=2

" Show invisible characters
set list

" Setup what characters to show
set listchars=""
set listchars=trail:.

""""""""""""""""""""""""""
"  => Colors and Scheme  "
""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

set background=dark
colorscheme chocolateliquor

" set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix

"""""""""""""""""""""""""""""""""""""
"  => Text, tab and indent related  "
"""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Set indent options
set ai
set si
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""
"  => Moving around, tabs, windows and buffers  "
"""""""""""""""""""""""""""""""""""""""""""""""""
" Map <space> to / (search) and Ctrl-<space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent><leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Map Y to act like D and C, i.e to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Handy file open shortcuts
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%


""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""
if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%2*%-3.3n%0*\                 " buffer number
  set statusline+=%f\                          " file name
  set statusline+=%h%1*%m%r%w%0*               " flags
  set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
  set statusline+=%{&encoding},                " encoding
  set statusline+=%{&fileformat}]              " file format
  set statusline+=%=                           " right align
  set statusline+=Line:%l/%L[%p%%]\ \          " Line Number
  set statusline+=Col:%v\ \                    " Col Number
  set statusline+=Char:[%b][0x%B]              " current char
endif

set number
set vb t_vb=
set ts=2 sts=2 sw=2 expandtab





let g:UltiSnipsSnippetsDir = "~/.vim/bundle/ultisnips/UltiSnips"
