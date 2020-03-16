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

" color schemes
Plugin 'tomasiser/vim-code-dark'
Plugin 'altercation/vim-colors-solarized'
let g:solarized_termtrans=1 " transparent background
let g:solarized_contrast="high"
set t_Co=256
set t_ut=

" file system explorer
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
map <C-n> :NERDTreeToggle<CR> " open NERDTree with <ctrl + n>
" tag generator
Plugin 'ludovicchabant/vim-gutentags'
let g:gutentags_enabled=1
" open NERDTree automatically when vim starts up if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close NERDTree if it's the only pane open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" commenter plugin
Plugin 'preservim/nerdcommenter'
" TODO: ADD CUSTOM KEY BINDINGS TO MAKE THIS EASIER to toggle
" noremap <C-/> <leader>c<space>
let g:NERDSpaceDelims=2 " add an extra space after the comment
" visualize the undo tree
Plugin 'simnalamburt/vim-mundo'
nnoremap <C-m> :MundoToggle<CR>
" <ENTER> brings up Mundo by default, keeps hitting it by accident
noremap <ENTER> <nop>
let g:mundo_right = 1 " mundo open on the right
" plugin for .tmux.conf
Plugin 'tmux-plugins/vim-tmux'
" autocomplete for vim
Plugin 'ycm-core/YouCompleteMe'
" search files
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_working_path_mode=0
" syntax error highlight
Plugin 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height=5
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" rainbow color for matching parenthesis
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1 " can be toggled with :RainbowToggle
" visualize indentation
Plugin 'Yggdroot/indentLine'
let g:indentLine_enabled = 1
" automatically close brackets
Plugin 'jiangmiao/auto-pairs'
let g:AutoPairs={'{':'}', '(':')', '[':']'} " plugin default includes too many pairs
" automatic formatting
Plugin 'Chiel92/vim-autoformat'
" NOTE: format programs need to be manually installed, see https://github.com/Chiel92/vim-autoformat#default-formatprograms
au BufWrite * :Autoformat " automatically format on save
let g:autoformat_autoindent = 0 " disable fall back to vim's indent file

" status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme = 'codedark'

" git support
Plugin 'tpope/vim-fugitive'
set diffopt+=vertical " :Gdiff splits vertically instead of horizontally
Plugin 'airblade/vim-gitgutter' " add helpers in the file gutter (along the line numbers)
autocmd BufWritePost * GitGutter " update gutter when saving file

" typescript support
Plugin 'leafgarland/typescript-vim' " syntax highlighting in .ts and .d.ts files
Plugin 'Quramy/vim-js-pretty-template' " template synx
Plugin 'mhartington/vim-typings' " TypeScript typings
Plugin 'Quramy/tsuquyomi' " autocompletion

" c# support
Plugin 'OmniSharp/omnisharp-vim' " IDE-like support for c#
let g:OmniSharp_server_stdio = 1 " Use the stdio version of OmniSharp-roslyn, set to 0 to use HTTP version

" java support
Plugin 'artur-shaik/vim-javacomplete2'
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" python support
Plugin 'klen/python-mode' " IDE support for python

" sql support
Plugin 'lifepillar/pgsql.vim'
let g:sql_type_default = 'pgsql'

" latex support
Plugin 'lervag/vimtex'

" <<< vundle plugins <<<

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Key Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" The key bindings below are adapted from
" https://www.techrepublic.com/blog/linux-and-open-source/create-custom-keybindings-in-vim/
" map CTRL-d to the end of line
nnoremap <C-d> $
inoremap <C-d> <Esc>$i
" map CTRL-a to the beginning of line
nnoremap <C-a> 0
inoremap <C-a> <Esc>0i

" map CTRL-c to copy in visual mode
vnoremap <C-c> y
" map CTRL-x to cut in visual mode
vnoremap <C-x> x
" map CTRL-v to paste in insert mode
inoremap <C-v> <Esc>pi

" map CTRL-backslash to write
nnoremap <C-Bslash> :w<CR>
inoremap <C-Bslash> <Esc>:w<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme
syntax enable
set background=dark
colorscheme codedark

" <TAB>
set expandtab " <TAB> gives spaces
set softtabstop=4 " number of spaces to remove when hitting backspace
set tabstop=4 " number of visual spaces to display per <TAB> character
set shiftwidth=4 " how many spaces to use for an indentation (hitting ENTER)

" folding
set foldmethod=indent
set foldnestmax=10 " don't fold anything deeper than 10
set foldlevel=4

" splitting with vs
set splitbelow " create new pane below current pane 'sp'
set splitright " create new pane to the right of current pane with 'vs'

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
set timeoutlen=1000 ttimeoutlen=10 " make ESC respond faster

" automatically puts the copied or cut text into system clipboard
" should be 'unnamedplus' for Linux and 'unnamed' for MacOS
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error
  if s:uname == "Linux"
    set clipboard=unnamedplus
  elseif s:uname == "Darwin" " MacOS
    set clipboard=unnamed
  endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" while editing sql files, hitting left or right arrow with suggestion won't
" give the error 'SQLComplete: The ebext plugin must be loaded for dynamic
" SQL completion', which is annoying.
let g:omni_sql_no_default_maps=1

" disable the generation of *.swp and *~ files permanently. Save often, folks.
set nobackup
set noswapfile
