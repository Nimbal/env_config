" Clear all autocommands. Otherwise, re-sourcing this vimrc might get weird
autocmd!


""""""""""
" Vundle "
""""""""""

" Use vim behaviour, not vi
set nocompatible    

" Required by Vundle, re-enabled later on
filetype off        

" Find directory of this script (resolving symlinks)
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Add bundles to runtime path
execute "set rtp+=" . s:path . "/bundle/vundle"

" Init vundle
call vundle#rc()


"""""""""""
" Plugins "
"""""""""""

" Vundle Plugin manager
Bundle 'VundleVim/Vundle.vim'

" Gruvbox color scheme
Bundle 'morhetz/gruvbox'

" Skittles Berry color scheme
Bundle 'shawncplus/skittles_berry'

" Airline status line
Bundle "vim-airline/vim-airline"
Bundle "vim-airline/vim-airline-themes"

" Snipmate Dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"

" Insert predefined text blocks
Bundle "garbas/vim-snipmate"

" Some default snippets for snipmate
Bundle "honza/vim-snippets"

" Async commands like make
Bundle "tpope/vim-dispatch"

" Shortcuts for going through quickfix list (and others)
Bundle "tpope/vim-unimpaired"

" Doxygen tools
Bundle "mrtazz/DoxygenToolkit.vim"

" Fuzzy file opener
Bundle "kien/ctrlp.vim"

" Ack-grep
Bundle "mileszs/ack.vim"

" Note taking
Bundle "xolox/vim-misc"
Bundle "xolox/vim-notes"

" GLSL syntax highlighting
Bundle "tikhomirov/vim-glsl"

" Better f/t
Bundle "unblevable/quick-scope"

" HLSL syntax highlighting
Bundle "beyondmarc/hlsl.vim"

" Git integration
Bundle "tpope/vim-fugitive"

"""""""""""""""
" Basic stuff "
"""""""""""""""

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Auto reload and write to disk
set autoread autowrite

" Keep 50 lines of command line history
set history=50		

" Show currently running command, also provides information about selected
" area in visual mode
set showcmd		    

" Use incremental searching
set incsearch		

" Don't show intro message on startup
set shortmess+=I    


" Switch syntax highlighting on
syntax on

" Respect .bashrc
if has("unix")
    set shell=bash\ --login
endif

" Highlight current line
set cursorline

" Show relative numbers in gutter, absolute number for current line
set number
set relativenumber

" Enable per-project settings
set exrc

" Disable shenanigans for local vimrc. Unfortunately, this causes trouble in
" Windows because it can't handle ownership of the local .vimrc like Unix can.
" Among other things, we can't set the makeprg there. So only enable it for
" unix.
if has("unix")
    set secure
endif

" Swap file location
set dir=/var/tmp//,$HOME\\vim_swap//,$TMP

" Enable filetype plugins
filetype plugin on

" Never wrap lines by default
set nowrap

" Wrap lines for quickfix window
autocmd FileType qf setlocal wrap linebreak


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
if has("win32")
    nnoremap <F5> :wa<CR>:Make<CR>
else
    " Can't really make vim-dispatch work properly in Linux, use default :make
    " for now
    nnoremap <F5> :wa<CR>:make<CR>
endif

""""""""""""
" UI Stuff "
""""""""""""

" Disable menu & toolbars in GUI mode
set guioptions-=e  " No tab pages
set guioptions-=M  " Don't source menu.vim
set guioptions-=m  " No menu bar
set guioptions-=t  " No tearoff menu items
set guioptions-=T  " No toolbar
set guioptions-=l  " No left-hand scroll bar
set guioptions-=L  " No left-hand scroll bar, even when split
set guioptions-=r  " No right-hand scroll bar
set guioptions-=R  " No right-hand scroll bar, even when split
set guioptions-=b  " No bottom scrollbar
set guioptions-=h  " No bottom scrollbar length

if has("gui_running")
    " Disable error bell
    autocmd GUIEnter * set vb t_vb=
endif


"""""""""""
" Airline "
"""""""""""

" Set encoding for nice symbols in status line
set encoding=utf-8

" Always show status line for each window
set laststatus=2

" Don't show vims normal mode line
set noshowmode 

" Set font for status line
let g:airline_powerline_fonts = 1
if has("win32")
    set guifont=Powerline_Consolas:h10
else
    set guifont=Inconsolata\ for\ Powerline\ 10
endif

" Disable some sections
" b: git branch
" x: filetype
" y: file encoding
let g:airline_section_b = ''
let g:airline_section_x = ''
let g:airline_section_y = ''

let g:airline#extensions#whitespace#checks = [ 'indent' ]
AirlineTheme bubblegum

"""""""""
" CMake "
"""""""""

" Load cmake indent file when editing cmake files
:autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in runtime! indent/cmake.vim

" Set filetype to cmake for syntax highlighting
:autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setf cmake


""""""""""
" Ctrl-P "
""""""""""

" Unset ctrlp_user_command because the default ignores wildignore
if exists("g:ctrlp_user_command") 
    unlet g:ctrlp_user_command
endif

" Ignore all build directories
set wildignore+=build/**,*/build-*

" Ignore backup files
set wildignore+=*~

" Ignore CMake cache files
set wildignore +=*/CMakeFiles/**

" Bash-like tab completion
set wildmode=longest,list

" Just use the pwd, don't bother searching in other directories
let g:ctrlp_working_path_mode = "0" 

" Always use regex search (required for ctrlp_abbrev setting below)
let g:ctrlp_regexp = 1 

" Replace <space> with .* in ctrl-p prompt
let g:ctrlp_abbrev = {
\ 'gmode': 'i',
\ 'abbrevs': [
  \ {
    \ 'pattern': '\(^@.\+\|\\\@<!:.\+\)\@<! ',
    \ 'expanded': '.*',
    \ 'mode': 'pfrz',
  \ },
  \ ]
\ }
    

"""""""""""""
" Indenting "
"""""""""""""

" Auto indent new line
set autoindent

" Make autoindent smarter
set smartindent

" Make tabs four spaces wide
set tabstop=4

" Insert four spaces when indenting lines
set shiftwidth=4

" Use spaces, no tab stops
set expandtab

" Insert four spaces when hitting <Tab> in insert mode
set softtabstop=4

" Always keep 10 lines visible between cursor and first / last window line
set scrolloff=10


""""""""""""""""
" Color scheme "
""""""""""""""""

" Dark theme
set background=dark

" Use gruvbox, but don't complain if it hasn't been installed yet
silent! colorscheme gruvbox


""""""""""""
" Encoding "
""""""""""""
set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=utf-8,latin1


"""""""
" Git "
"""""""
set diffopt=filler,vertical

