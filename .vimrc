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

" paste
set noautoindent

" disable swap files
set noswapfile

" vundle
filetype off
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'neoclide/coc.nvim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/nerdtree'
Plugin 'chrisbra/Colorizer'
Plugin 'itchyny/lightline.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'pseewald/vim-anyfold'

" End plugins
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
set ignorecase

" colours
set hlsearch
if has('gui_running')
    set guifont=Menlo\ Regular:h13
    set antialias
    set background=dark
    colorscheme onedark
    hi Search ctermbg=White
    hi Search ctermfg=Red
    hi Visual guifg=White guibg=DarkBlue gui=none
else
    colorscheme onedark
    hi Search ctermbg=White
    hi Search ctermfg=Red
    hi Visual guifg=White guibg=DarkBlue gui=none
endif

" NERDTree
let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1
let g:NERDTreeWinPos = "left"
let NERDTreeRespectWildIgnore=1
let g:NERDTreeWinSize=25
set wildignore+=*.swp,*.DS_Store,

" any-fold
autocmd Filetype * AnyFoldActivate
set foldlevel=99

" remappings
imap JH <esc>
imap jh <Esc>
cmap WP w !python3  
cmap vhelp vert h
cmap hhelp help
cmap NT NERDTree
nnoremap <Tab> :tabn <ENTER>
nmap <leader><Tab> :tabp <ENTER>

set number
set smartindent
set linebreak
set tabstop=4
set shiftwidth=4
autocmd Filetype javascript setlocal tabstop=4
autocmd Filetype javascript setlocal shiftwidth=4
autocmd Filetype html setlocal tabstop=4
autocmd Filetype html setlocal shiftwidth=4
set expandtab
set clipboard=unnamed

autocmd VimEnter * NERDTree .
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
