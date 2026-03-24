"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" color schemes
Plug 'tomasiser/vim-code-dark'
Plug 'altercation/vim-colors-solarized'

" file system explorer
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" tag generator
Plug 'ludovicchabant/vim-gutentags'

" commenter plugin
Plug 'preservim/nerdcommenter'

" visualize the undo tree
Plug 'simnalamburt/vim-mundo'

" plugin for .tmux.conf
Plug 'tmux-plugins/vim-tmux'

" intellisense engine (replaces YouCompleteMe)
" After install, run: :CocInstall coc-tsserver coc-pyright coc-json
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" fuzzy file/content search (replaces CtrlP)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" rainbow color for matching parenthesis
Plug 'luochen1990/rainbow'

" visualize indentation
Plug 'Yggdroot/indentLine'

" automatically close brackets
Plug 'jiangmiao/auto-pairs'

" toggle quickfix/location list
Plug 'milkypostman/vim-togglelist'

" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" async lint and fix (replaces syntastic)
Plug 'w0rp/ale'

" typescript syntax highlighting (replaces leafgarland/typescript-vim + tsuquyomi)
Plug 'HerringtonDarkholme/yats.vim'

" c# support
Plug 'OmniSharp/omnisharp-vim'

" java support
Plug 'artur-shaik/vim-javacomplete2'

" python support
Plug 'klen/python-mode'

" sql support
Plug 'lifepillar/pgsql.vim'

" latex support
Plug 'lervag/vimtex'

" terraform support
Plug 'hashivim/vim-terraform'

call plug#end()

filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" --- color schemes ---
let g:solarized_termtrans=1 " transparent background
let g:solarized_contrast="high"
set t_Co=256
set t_ut=

" --- nerdtree-git-plugin ---
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusUseNerdFonts = 0

" --- NERDTree ---
let g:NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFind<CR>
" open NERDTree automatically when vim starts up if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close NERDTree if it's the only pane open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" automatically refresh NERDTree when entering a buffer
autocmd BufEnter * NERDTreeRefreshRoot

" --- gutentags ---
let g:gutentags_enabled=1
let g:gutentags_ctags_executable='/opt/homebrew/bin/ctags'

" --- nerdcommenter ---
let g:NERDSpaceDelims = 1

" --- Mundo ---
nnoremap <C-m> :MundoToggle<CR>
let g:mundo_right = 1
" Only suppress Enter in normal editing buffers to avoid accidentally opening Mundo
autocmd BufEnter * if &buftype == '' | nnoremap <buffer> <ENTER> <nop> | endif

" --- auto-pairs ---
let g:AutoPairs={'{':'}', '(':')', '[':']'}

" --- airline ---
let g:airline_theme = 'codedark'

" --- vim-gitgutter ---
set diffopt+=vertical
autocmd BufWritePost * GitGutter

" --- ALE ---
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['ruff', 'ruff_format'],
            \ 'typescript': ['prettier'],
            \ 'typescriptreact': ['prettier'],
            \ 'javascript': ['prettier'],
            \ 'javascriptreact': ['prettier'],
            \ 'terraform': ['terraform'],
            \ }
let g:ale_linters = {
            \ 'python': ['ruff'],
            \ 'typescript': ['tsserver', 'eslint'],
            \ 'typescriptreact': ['tsserver', 'eslint'],
            \ 'cs': ['OmniSharp'],
            \ }
let g:ale_python_ruff_executable = '/Users/zguan/Projects/.venv/bin/ruff'

" --- fzf ---
nnoremap <C-p> :Files<CR>
nnoremap <leader>f :Rg<CR>

" --- coc.nvim ---
" Use Tab to navigate completion menu
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Show signature help automatically when jumping to a placeholder
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" --- rainbow ---
let g:rainbow_active = 1

" --- indentLine ---
let g:indentLine_enabled = 1

" --- OmniSharp ---
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_hightlight_types = 3
set previewheight=5
set completeopt=longest,menuone,preview

" --- java ---
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" --- pgsql ---
let g:sql_type_default = 'pgsql'

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
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4

" folding
set foldmethod=indent
set foldnestmax=10
" fold everything by default only if file is longer than 300 lines
set foldlevel=99
autocmd BufReadPost * if line('$') > 300 | set foldlevel=0 | endif

" splitting
set splitbelow
set splitright

" ui
set number
set showcmd
set wildmenu
set lazyredraw
set showmatch
set ruler

" search
set incsearch
set hlsearch

" tabs
set showtabline=2

" line
set tw=0
set wrap linebreak nolist

" miscellaneous
set encoding=utf-8
set mouse=a
set timeoutlen=1000 ttimeoutlen=10

" automatically puts the copied or cut text into system clipboard
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error
  if s:uname == "Linux"
    set clipboard=unnamedplus
  elseif s:uname == "Darwin"
    set clipboard=unnamed
  endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" suppress annoying SQL completion error
let g:omni_sql_no_default_maps=1

" disable swp and ~ files
set nobackup
set noswapfile
