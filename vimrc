set nocompatible " Set to be non-compatible to vi

" source helper functions
source ~/.vim/settings/@functions.vim

"""""""""""""""""""""""""""""
" => Vim directory path     "
"""""""""""""""""""""""""""""
let $VIMHOME=expand('<sfile>:p:h')
if WINDOWS()
    let $VIMHOME=expand('$VIMHOME/vimfiles')
elseif OSX()
    let $VIMHOME=expand('$VIMHOME/.vim')
else
    let $VIMHOME=expand('$VIMHOME/.vim')
endif

" Map leader to space bar
" Note: This line MUST come before any <leader> mappings
let mapleader = "\<space>"
let g:mapleader = "\<space>"

"""""""""""""""""""""""""""""
" => Setup vundle plugin  "
"""""""""""""""""""""""""""""

if filereadable(expand("~/.vim/vimrc.bundles"))
  source ~/.vim/vimrc.bundles
endif

" ----------------------------------------
" Platform Specific Configuration
" ----------------------------------------

if WINDOWS()
  " Windows
  source $VIMRUNTIME/mswin.vim
  set guifont=Consolas:h10
  set guioptions-=T " Toolbar
  set guioptions-=m " Menubar

  " Set height and width on Windows
  set lines=60
  set columns=120

  " Windows has a nasty habit of launching gVim in the wrong working directory
  cd ~
elseif has('gui_macvim')
  " MacVim
  " Custom Inconsola-dz font for Powerline
  " From: https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
  set guifont=Inconsola-dz\ for\ Powerline:h14

  " Hide Toolbar in MacVim
  if has("gui_running")
    set guioptions=egmrt
  endif

  " Use option (alt) as meta key.
  set macmeta
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Regular Vim Configuration (No Plugins Needed)                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""
"  => Colors and Scheme  "
""""""""""""""""""""""""""
set t_Co=256
set background=dark
try
  "colorscheme chocolateliquor
  colorscheme jellybeans
catch /E185:/
  colorscheme default
endtry

"""""""""""""""""""""""""""""""""""""""""""""""
"  => Setup Directories - backup, undo, view  "
"""""""""""""""""""""""""""""""""""""""""""""""
call MkDir($HOME . "/tmp/.vim")
call MkDir($HOME . "/tmp/.vim/bak")
call MkDir($HOME . "/tmp/.vim/swp")
call MkDir($HOME . "/tmp/.vim/und")
call MkDir($HOME . "/tmp/.vim/viw")

" Set central location for vim temporary files
set backupdir=$HOME/tmp/.vim/bak//     "backup
set directory=$HOME/tmp/.vim/swp//     "swap
set undodir=$HOME/tmp/.vim/und//       "undo
set viewdir=$HOME/tmp/.vim/viw//       "view

if has ('persistent_undo')
  set undofile
  set undolevels=2000
  set undoreload=10000
endif

" use a tags file (if any)
set tags=./tags;

"""""""""""""""""""""""""""""""""""""""""""""""
"  => VIM user interface                      "
"""""""""""""""""""""""""""""""""""""""""""""""

set ruler          " Always show the ruler
set number         " Line Numbers on
set wrap
set cmdheight=2    " Height of the command bar
set encoding=utf-8 " set utf-8 as standard encoding
set lazyredraw     " Don't redraw while executing macros (good performance config)
set cursorline
set cursorcolumn

" number line settings {{{
" --------------------------------------------------------------------------------
if has ("autocmd")
  autocmd FocusLost * :set norelativenumber
  autocmd BufLeave * :set norelativenumber
  autocmd InsertEnter * :set number

  autocmd FocusGained * :set relativenumber
  autocmd BufEnter * :set relativenumber
  autocmd InsertLeave * :set relativenumber
else
  set relativenumber " Show relative numbers
endif

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

""""""""""""""""""""""""""""""
" => Behaviors               "
""""""""""""""""""""""""""""""
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif
set autoread    " Automatically reload changes if detected
set hidden      " A buffer becomes hidden when it is abandoned
set history=700 " Sets how many lines of history VIM has to remember
set autowrite   " Writes on make/shell commands


if has ("autocmd")
  filetype plugin indent on " Enable filetype plugins
endif

if has ("wildmenu") " Turn on the Wild menu
  set wildmenu

  set wildmode=longest,list

  " Ignore stuff
  set wildignore+=*.o,*.a
  set wildignore+=*~,*.pyc
  set wildignore+=*.swp,*.tmp

  " Disable image/video/audio files
  set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.avi,*.mkv,*.mov,*.mp3

  " Disable output and VCS files
  set wildignore+=*.o,*.a,*.out,*.obj,.git,*.hg,*.rbc,*.rbo,*.class,.svn,*.gem

  " Disable compiled files
  set wildignore+=*.exe,*.pyc,*.elc

  " Disable archive files
  set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

  " Ignore bundler and sass cache
  set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,
        \*.lock

  " Disable temp and backup files
  set wildignore+=*.tmp,*.swp,*~,._*,.DS_Store,*/.vim/und/*
endif

"""""""""""""""""""""""""""""""""""""
"  => Text, tab and indent related  "
"""""""""""""""""""""""""""""""""""""

set expandtab         " Use spaces instead of tabs
set smarttab          " Be smart when using tabs
set list              " Show invisible characters
set listchars=trail:. " Setup what characters to show
set shiftwidth=2
set softtabstop=2
set tabstop=2         " 1 tab == 2 spaces
set ffs=unix          " Use Unix as the standard file type

" Set indent options
set autoindent
set smartindent

"""""""""""""""""""""""""""""""""""""""""""""""
"  => Searching                               "
"""""""""""""""""""""""""""""""""""""""""""""""

set ignorecase " Ignore case when searching
set smartcase  " When searching try to be smart about cases
set incsearch  " Makes search act like search in modern browsers
set hlsearch   " Highlight search results
set magic      " Regular expressions
set so=5       " When searching for text centre the found line in the middle of the screen


" Configure backspace and wrapping
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set showmatch " Show matching brackets when text indicator is over them
set matchtime=2 " How long to show for in tenths of a second


"""""""""""""""""""""""""""""""""""""""""""""""
"  => Sounds                                  "
"""""""""""""""""""""""""""""""""""""""""""""""
set noerrorbells
set visualbell
set t_vb=

" ---------------
" Fix pasting into Terminal from System Clipboard
" ---------------
if &term =~ "xterm.*"
  let &t_ti = &t_ti . "\e[?2004h"
  let &t_te = "\e[?2004l" . &t_te
  function XTermPasteBegin(ret)
    set pastetoggle=<Esc>[201~
    set paste
    return a:ret
  endfunction
  map <expr> <Esc>[200~ XTermPasteBegin("i")
  imap <expr> <Esc>[200~ XTermPasteBegin("")
  cmap <Esc>[200~ <nop>
  cmap <Esc>[201~ <nop>
endif

""""""""""""""""""""""""""""""
" => Plugin Configuration
"""""""""""""""""""""""""""""""
for f in split(glob('~/.vim/settings/*.vim'), '\n')
  exe 'source' f
endfor
