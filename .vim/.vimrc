set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

" Remove all auto commands so they aren't defined twice
autocmd!

" Auto reload and write to disk
set autoread autowrite

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

" Disable menu & toolbars in GUI mode
set guioptions-=M
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		" do incremental searching


" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on
syntax on

" Auto indenting
set autoindent

" Powerline
set laststatus=2
set rtp+=/usr/local/lib/python2.7/dist-packages/Powerline-beta-py2.7.egg/powerline/bindings/vim
set noshowmode " Don't show vims normal mode line
" set term=xterm-256color
set guifont=Droid\ Sans\ Mono\ for\ Powerline

" CMake
:autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in runtime! indent/cmake.vim 
:autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setf cmake
:autocmd BufRead,BufNewFile *.ctest,*.ctest.in setf cmake

" Ignore build directories and backup files
set wildignore+=build/**,build-clang/**,build-w64/**,*~
set wildmode=longest,list

" Respect .bashrc
set shell=bash\ --login

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
set secure


" Tags
set tags+=~/.vim/tags/qt4.tags
set tags+=~/.vim/tags/sigc++.2.0.tags
set tags+=~/.vim/tags/std.tags
map <C-F6> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Swap file location
set dir=/var/tmp//,$HOME\\vim_swap//

" Enable filetype plugins
filetype plugin on

" Bundles
Bundle 'vim-scripts/RelOps'
Bundle 'altercation/vim-colors-solarized'


" Solarized colorscheme
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

