set runtimepath+=~/.vim_runtime

syntax on
set ignorecase

" colours
colorscheme desert
set hlsearch
hi Search ctermbg=White
hi Search ctermfg=DarkBlue
hi Visual  guifg=White guibg=DarkBlue gui=none

" paste
set noautoindent

" DIY autoclosing
inoremap (; ();<left><left>
inoremap [; [];<left><left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap {<cr> {<cr>}<esc>O
inoremap (<cr> (<cr>)<esc>O
inoremap [<cr> [<cr>]<esc>O
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ``` ```<cr>```<esc>O

" pathogen
execute pathogen#infect()
filetype plugin indent on

" vundle
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'"
" Plugins
Plugin 'valloric/youcompleteme'
" End plugins
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting=1
let g:syntastic_enable_signs=1
highlight SyntasticErrorLine guibg=#bf1313
highlight SyntasticWarningLine guibg=#ffd500

" terminal
set termwinsize=15x0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
