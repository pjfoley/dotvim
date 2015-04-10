" source helper functions
"source ~/.vim/settings/@functions.vim

call MkDir($HOME . "/tmp/.vim/nerd")

" NERDTree Stuff
nmap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap <leader>N :NERDTreeClose<CR>
let NERDTreeBookmarksFile=expand("$HOME/tmp/.vim/nerd")
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.hg' ]
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeHighlightCursorline=1
let NERDTreeMouseMode=2
