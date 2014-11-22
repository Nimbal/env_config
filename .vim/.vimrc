let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

""""""""""
" Vundle "
""""""""""
set nocompatible    " Use vim behaviour, not vi
filetype off        " Required by Vundle, re-enabled later on

execute "set rtp+=" . s:path . "/bundle/vundle"
call vundle#rc()                

" Bundles
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/RelOps'
Bundle 'altercation/vim-colors-solarized'

Bundle "bling/vim-airline"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle "tpope/vim-dispatch"
Bundle "tpope/vim-unimpaired"



autocmd!

" Auto reload and write to disk
set autoread autowrite

"""""""""""""
" Shortcuts "
"""""""""""""

" Better window switching keybinds
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"Map vim-dispatch's Make to F5
nnoremap <F5> :wa<CR>:Make<CR>

""""""""""""
" UI Stuff "
""""""""""""

" Disable menu & toolbars in GUI mode
set guioptions-=M
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

set history=50		" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		" do incremental searching
set shortmess+=I    " Don't show intro message on startup


" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on
syntax on

" Auto indenting
set autoindent

if has("gui_running")
    " Disable error bell
    autocmd GUIEnter * set vb t_vb=
endif

" vim-airline
set encoding=utf-8
set laststatus=2
set noshowmode " Don't show vims normal mode line
let g:airline_powerline_fonts = 1
set guifont=Powerline_Consolas:h12

" CMake
:autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in runtime! indent/cmake.vim 
:autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setf cmake
:autocmd BufRead,BufNewFile *.ctest,*.ctest.in setf cmake

" Ignore build directories and backup files
set wildignore+=build/**,build-clang/**,build-w64/**,*~
set wildmode=longest,list

" Respect .bashrc
if has("unix")
    set shell=bash\ --login
endif

" Highlight current line
set cursorline
set number

" Tabs
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Scrolling
set scrolloff=10

" Wrapping
set nowrap
autocmd FileType qf setlocal wrap linebreak

" Enable per-project settings
set exrc
"set secure " Disabled because otherwise, I can't set makeprg in project local
"vimrc in Windows


" Tags
set tags+=~/.vim/tags/qt4.tags
set tags+=~/.vim/tags/std.tags
map <C-F6> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Swap file location
set dir=/var/tmp//,$HOME\\vim_swap//,$TMP

" Enable filetype plugins
filetype plugin on



" Solarized colorscheme
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

