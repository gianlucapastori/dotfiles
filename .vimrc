"*******************************************************************************
" .vimrc: LaTeX, general scripting, editing minimal configuration;
"*******************************************************************************

"*******************************************************************************
" general configuration and sane defaults.
"*******************************************************************************
set nocompatible 				" disable vi compatibility.

set exrc					" local .vimrc config.
set secure					" //

set history=1000				" lines to remember.

set updatetime=250				" update time.

nnoremap Q <NOP>				" disable Ex mode.

set nrformats-=octal				" better increase/descrease.

" general hotkeys.
nnoremap <F12> :so $HOME/.vimrc<CR>		" reload vim configuration file.

let mapleader = ','				" leader key for more combinarions.
let g:mapleader = ','				" //
set timeoutlen=3000 ttimeoutlen=100		" delay on <Leader>.

"*******************************************************************************
" minimalist user interface.
"*******************************************************************************
set showmode					" always show mode.
set showcmd 					" always show commands.
set laststatus=2				" always show status line.

set wildmenu					" enable wildmenu.

set ruler					" enable ruler.

set cmdheight=2					" command bar height.

set lazyredraw					" do not redraw while executing macros.

set showmatch					" show matching brackets.
set matchtime=0					" matching brackets blink.

set noerrorbells				" disable audio error bell.
set visualbell					" enable visual error bell.

set cursorline 					" highlight cursor line.
set nocursorcolumn				" highlight cursor column.

set autoindent					" enable autoindent.
set smartindent					" enable smartindent.

set noexpandtab					" tabs > spaces.
set smarttab

set shiftwidth=8				" tab space.
set tabstop=8

set wrap					" wrap text.

set colorcolumn=80				" columns at character 80.

set number					" show line numbers.
set numberwidth=2				" //

syntax enable					" syntax highlighting.

"*******************************************************************************
" files, searching and backups.
"*******************************************************************************
set noswapfile					" disable swap files.
set nobackup					" disable backup.
set nowritebackup				" //

set encoding=utf8

set fileformats=unix,dos,mac			" Unix as standard file type.

set autoread					" auto read file when it is changed from other application.

set hlsearch					" highlight search.

set incsearch					" better searching.
set wrapscan					" //
set ignorecase					" //
set smartcase					" //
set magic					" //

filetype plugin on				" enable filetype plugins.
filetype indent on				" //


"*******************************************************************************
" useful commands and functions.
"*******************************************************************************
" variables and constants.
let g:md_view_command = "pandoc daw.md | lynx -stdin"

" saves the file with super-user permissions.
cnoremap WW w !sudo tee > /dev/null %

" live-preview for .md files.
if executable('grip')
	command! -buffer PreviewMd execute 'Dispatch grip --pass grip -b %'
endif
