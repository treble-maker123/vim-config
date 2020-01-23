"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" >>> vundle plugins >>>

" for solarizied color theme
Plugin 'altercation/vim-colors-solarized'
" file system explorer
Plugin 'preservim/nerdtree'
" autocomplete for vim
Plugin 'ycm-core/YouCompleteMe'
" search stuff in files
Plugin 'ctrlpvim/ctrlp.vim'

" automatic formatting
Plugin 'Chiel92/vim-autoformat'
" NOTE: format programs need to be manually installed, see https://github.com/Chiel92/vim-autoformat#default-formatprograms
au BufWrite * :Autoformat " automatically format on save

" status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" typescript support
Plugin 'leafgarland/typescript-vim' " syntax highlighting in .ts and .d.ts files
Plugin 'Quramy/vim-js-pretty-template' " template synx
Plugin 'mhartington/vim-typings' " TypeScript typings
Plugin 'Quramy/tsuquyomi' " autocompletion

" python support
Plugin 'klen/python-mode' " converts vim into a Python IDE

" <<< vundle plugins <<<

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" color scheme
syntax enable
set background=dark
colorscheme solarized
hi Normal ctermbg=None " Turns background color off

" <TAB>
set expandtab " <TAB> gives spaces
set tabstop=2 " number of visual spaces to display per <TAB> character
set shiftwidth=2 " how many spaces to use for an indentation (hitting ENTER)

" folding
set foldenable " enable folding
set foldlevelstart=10 " levels to be folded to start
set foldnestmax=10 " max number of level of folds

" ui
set number " show line number
set showcmd " show last used command in bottom bar
set wildmenu " autocomplete menu
set lazyredraw " redraw screen only when needed
set showmatch " highlight matches [] () and {}
set ruler " show line and column number of the cursor

" search
set incsearch " search as characters are entered
set hlsearch " highlight matches

" tabs
set showtabline=2 " always show tabs at the top

" line
set tw=0 " text width, how many characers before wrapping. 0 means no wrap
set wrap linebreak nolist " setting soft wrap, so that no newline character is inserted at the end

" miscellaneous
set encoding=utf-8 " not sure if this is necessary
set mouse=a " alows for highlighting lines, placing the cursor, and scrolling with mouse

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"
" See https://github.com/preservim/nerdtree/wiki/F.A.Q. for more info
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" open NERDTree with <ctrl + n>
map <C-n> :NERDTreeToggle<CR>

" Open NERDTree automatically when vim starts up if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
"
" See https://github.com/ctrlpvim/ctrlp.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" c - the directory of the current file
" a - the directory of the current file, unless it is a subdirectory of the cwd
" r - the nearest ancestor of the current file that contains one of these directories or files: .git .hg .svn .bzr _darcs
let g:ctrlp_working_path_mode='car'
