" Fast saving
nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""
"  => Moving around, tabs, windows and buffers  "
"""""""""""""""""""""""""""""""""""""""""""""""""
" Map <space> to / (search) and Ctrl-<space> to ? (backwards search)
map <space> /
map <c-space> ?

" Remove highlight when <cr> is pressed
nnoremap <leader><cr> :noh<cr><cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Handy file open shortcuts
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
map <leader>w= :wincmd =<cr>

" Map Y to act like D and C, i.e to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" In cmd mode, + and - vertically enlarge/shrink a split
noremap <silent> = :call WinMove('+')<CR>
noremap <silent> - :call WinMove('-')<CR>
noremap <silent> + :call WinMove('>')<CR>
noremap <silent> _ :call WinMove('<')<CR>

" Auto-indent pastes according to surrounding code.
nnoremap <leader>p p
nnoremap <leader>P P
nnoremap p p'[v`]=`]
nnoremap P P'[v`]=`]

" Reselect visual section after indent/outdent.
vnoremap < <gv
vnoremap > >gv

" Visually select the text that was last edited/pasted.
nnoremap gV `[v`]

 
" Easier Scrolling (think j/k with left hand).
" C + d (page up)
" C + f (page down)
nmap <C-d> <C-b>

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yank stack (also, in visual mode).
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

" ,s to search or ,S to search for word under cursor.
nnoremap <leader>s :%s/\v
nnoremap <Leader>S :%s/<c-r>=expand('<cword>')<cr>//gc<left><left><left>

" find merge conflict markers
nmap <LEADER>fc /\v^[<\|=>]{7}( .*\|$)<CR>

