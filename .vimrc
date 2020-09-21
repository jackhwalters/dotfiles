set nocompatible

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" turn on syntax highlighting
syntax on
set ignorecase

" colours
set hlsearch
hi Search ctermbg=White
hi Search ctermfg=DarkBlue
hi Visual  guifg=White guibg=DarkBlue gui=none
syntax enable
set background=dark
colorscheme solarized

" paste
set noautoindent

" vundle
filetype off
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'valloric/youcompleteme'
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'leafgarland/typescript-vim'
Plugin 'dbakker/vim-lint'
Plugin 'mattn/vim-terminal'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'chrisbra/color_highlight.git'
Plugin 'skwp/vim-colors-solarized'
Plugin 'itchyny/lightline.vim'
Plugin 'jby/tmux.vim.git'
Plugin 'morhetz/gruvbox'
Plugin 'xsunsmile/showmarks.git'
Plugin 'chriskempson/base16-vim'

" End plugins
call vundle#end()            " required
filetype plugin indent on    " required

" MacVim
set guifont=Menlo\ Regular:h12

" NERDTree
let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1
let g:NERDTreeWinPos = "left"
let NERDTreeRespectWildIgnore=1
set wildignore+=*.swp,*.DS_Store,

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=0
let g:syntastic_enable_signs=1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']

" terminal
set termwinsize=15x0

" remappings
:imap JH <esc>
:imap jh <Esc>
:cmap WP w !python3  
:cmap TR below term
:cmap vhelp vert h
:cmap hhelp help
:cmap NT NERDTree
:nnoremap <Tab> :tabn <ENTER>
:nmap <leader><Tab> :tabp <ENTER>

set number
