set encoding=utf8
set ffs=unix,dos,mac

if has('win32')
	set nocompatible
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
endif

"" pathogen
"execute pathogen#infect()

" Vundle
set nocompatible
set nowrap

"let bundle_dir = '/tmp/vundle-test/bundles/'
"silent execute '!mkdir -p '.bundle_dir
"silent execute '!ln -f -s ~/.vim/bundle/Vundle.vim '.bundle_dir

filetype off
syntax on
runtime macros/matchit.vim

if has('win32')
	set rtp+=$HOME/.vim/bundle/Vundle.vim/
	call vundle#begin('$HOME/.vim/bundle/')
else
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin(bundle_dir)
endif

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Bundle 'vim-scripts/ragtag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
"Plugin 'kien/ctrlp.vim'
Plugin 'tomasiser/vim-code-dark'
Plugin 'Shougo/denite.nvim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax' 
Plugin 'will133/vim-dirdiff' 						 
" ... more vundle plugins
call vundle#end()

filetype plugin indent on

set wildignore+=doc            " should not break helptags
set wildignore+=.git           " should not break clone
set wildignore+=.git/*         " should not break clone
set wildignore+=*/.git/*

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * NERDTree

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" fzf fuzzy finder
set rtp+=~/.fzf

" pandoc/markdown
let g:pandoc#folding#level = 3
"" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" indenting
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab
syn on se title

set number

" search
set ignorecase
set hlsearch
set magic
set showmatch
set mat=2

" colours and fonts
syntax enable
color codedark
if has('win32')
	:set guifont=Lucida_Console:h9:cDEFAULT
endif
try
	set termguicolors
	set background=light
	colorscheme colibri 
catch
endtry

" turn of backup mode
set nobackup
set nowb
set noswapfile

if has('win32')
	autocmd GUIEnter * simalt ~x
endif	   