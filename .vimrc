
" dein plugin 

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('scrooloose/nerdtree')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
"  call dein#add('ryanoasis/vim-devicons')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
"  call dein#add('powerline/powerline')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

colorscheme molokai
set t_Co=256

set backspace=indent,eol,start
set number


" colorscheme xoria256
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set linespace=15

set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell           " don't beep
set noerrorbells         " don't beep
set autowrite  "Save on buffer switch
set mouse=a

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saves
nmap <leader>w :w!<cr>

" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal model
imap jj <esc>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"easier window navigation

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Resize vsplit
nmap <C-v> :vertical resize +5<cr>
nmap 25 :vertical resize 40<cr>
nmap 50 <c-w>=
nmap 75 :vertical resize 120<cr>

nmap <C-n> :NERDTreeToggle<cr>

"Load the current buffer in Chrome
nmap ,c :!open -a Google\ Chrome<cr>

"Show (partial) command in the status line
set showcmd

" Create split below
nmap :sp :rightbelow sp<cr>

" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>

highlight Search cterm=underline

" Swap files out of the project root
"set backupdir=~/.vim/backup//
"set directory=~/.vim/swap//

" Run PHPUnit tests
map <Leader>t :!phpunit %<cr>

" Easy motion stuff
let g:EasyMotion_leader_key = '<Leader>'

" Powerline (Fancy thingy at bottom stuff)
"let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" vim-airline themes and fonts
" vim-devicon (ryanoasis/vim-devicons)
"let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'

autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

" Show Bookmarks
let g:NERDTreeShowBookmarks=1"

" Neocomplete setups
let g:neocomplete#enable_at_startup = 1

" Remove search results
command! H let @/=""

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" NERDTree setups
"autocmd vimenter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTree close vim if only the left window is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



" Abbreviations
abbrev pft PHPUnit_Framework_TestCase

abbrev gm !php artisan generate:model
abbrev gc !php artisan generate:controller
abbrev gmig !php artisan generate:migration

" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e

" Edit todo list for project
nmap ,todo :e todo.txt<cr>

" Laravel framework commons
nmap <leader>lr :e app/routes.php<cr>
nmap <leader>lca :e app/config/app.php<cr>81Gf(%O
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader>lc :e composer.json<cr>

" Concept - load underlying class for Laravel
function! FacadeLookup()
    let facade = input('Facade Name: ')
 j  let classes = {
\       'Form': 'Html/FormBuilder.php',
\       'Html': 'Html/HtmlBuilder.php',
\       'File': 'Filesystem/Filesystem.php',
\       'Eloquent': 'Database/Eloquent/Model.php'
\   }

    execute ":edit vendor/laravel/framework/src/Illuminate/" . classes[facade]
endfunction
nmap ,lf :call FacadeLookup()<cr>

" CtrlP Stuff
" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr>
map <C-r> :CtrlPBufTag<cr>

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

" Create/edit file in the current directory
nmap :ed :edit %:p:h/

" Prepare a new PHP class
function! Class()
    let name = input('Class name? ')
    let namespace = input('Any Namespace? ')

    if strlen(namespace)
        exec 'normal i<?php namespace ' . namespace . ';
    else
        exec 'normal i<?php
    endif

    " Open class
    exec 'normal iclass ' . name . ' {^M}^[O^['
    
    exec 'normal i^M    public function __construct()^M{^M ^M}^['
endfunction
nmap ,1  :call Class()<cr>

" Add a new dependency to a PHP class
function! AddDependency()
    let dependency = input('Var Name: ')
    let namespace = input('Class Path: ')

    let segments = split(namespace, '\')
    let typehint = segments[-1]

    exec 'normal gg/construct^M:H^Mf)i, ' . typehint . ' $' . dependency . '^[/}^>O$this->^[a' . dependency . ' = $' . dependency . ';^[?{^MkOprotected $' . dependency . ';^M^[?{^MOuse ' . namespace . ';^M^['

    " Remove opening comma if there is only one dependency
    exec 'normal :%s/(, /(/g
'
endfunction
nmap ,2  :call AddDependency()<cr>
