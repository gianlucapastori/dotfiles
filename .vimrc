""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => GENERAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" how many lines vim has to remeber.
set history=500

" enable filetype plugins.
filetype plugin on
filetype indent on

" change file when is modified outside vim.
set autoread
au FocusGained,BufEnter * checktime

" set leadermap to space.
let mapleader = " "
nnoremap <SPACE> <Nop>

" use :W to save the file with super user 
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => VIM UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mark at 80 char.
set cc=80

" prevent windows chinese language bug.
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" wild menu completion.
set wildmenu

" ignore compiled files.
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=.git\*,.hg\*,.svn\*
else
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.SD_Store
endif

" always show current position
set ruler

" command bar height.
set cmdheight=1

" buffer becomes hidden when abandoned.
set hid

" better backspace.
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" better searching.
set smartcase
set incsearch

" ignore case when searching.
set ignorecase

" highlight search results.
set hlsearch

" do not redraw while executing macros.
set lazyredraw

" magic for regular expressions.
set magic

" match brackets when hover.
set showmatch
set mat=2

" no bell indicator.
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" highlight syntax
syntax enable

set regexpengine=0

" utf-8 encoding.
set encoding=utf8

" unix standard file type.
set ffs=unix,dos,mac

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Files, Backup and undo.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" no backup.
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Text, tab and identation.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" spaces instead of tabs.
set expandtab

" smarttabs
set smarttab

" 4 spaces per tab (rule).
set shiftwidth=4
set tabstop=4

" linebreak at 500 char.
set lbr
set tw=500

" auto ident.
set ai

" smart indent.
set si

" wrap lines.
set wrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Visual mode behaviour
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search for current selection.
vnoremap <silent> *<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> #<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ommit W when moving buffers.
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

" close the current buffer.
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" close all the buffers.
map <leader>ba :bufdo bd<cr>

" move between buffers.
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" useful mappings for managing tabs.
map <leader>bn :tabnew<cr>
map <leader>bo :tabonly<cr>
map <leader>bc :tabclose<cr>
map <leader>bm :tabmove
map <leader>b<leader> :tabnext<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always show status line.
set laststatus=2

" format status line.
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" returns true if paste mode is enabled.
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
