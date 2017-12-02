filetype plugin indent on
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab
syn on se title
set number

set ignorecase
set hlsearch
set magic
set showmatch
set mat=2

" colours and fonts
syntax enable
try
	set termguicolors
	set background=light
	colorscheme colibri 
catch
endtry

set encoding=utf8
set ffs=unix,dos,mac

" turn of backup mode
set nobackup
set nowb
set noswapfile

" pathogen
execute pathogen#infect()

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>


