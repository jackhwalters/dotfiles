set runtimepath+=~/.vim_runtime

" colours
set hlsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Red
hi Visual  guifg=White guibg=LightBlue gui=none

" paste
set noautoindent

"DIY autoclosing
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
syntax on
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

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
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


" Remappings
:imap jh  <Esc>
:cmap wp  w !python3  
:cmap tr below term

cnoreabbrev vhelp vert h
cnoreabbrev hhelp help
cnoreabbrev NT NERDTree

set number
