execute pathogen#infect()
call pathogen#helptags()

colorscheme deus

syntax on

set number
set t_Co=256
set encoding=utf-8
set nocp
set autoindent
set noswapfile
set mouse=a
set si
set pastetoggle=<F2>
set termguicolors
set background=dark

inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ` ``<Left>
inoremap ' ''<Left>
inoremap [ []<Left>
inoremap { {}<Left>

let g:airline_theme='deus'
let g:airline_powerline_fonts=1
let g:indentLine_char = '┆'
let g:airline#extensions#tabline#enabled = 1
let g:deus_termcolors=256
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-n> :NERDTreeToggle<CR>
map <F2> :bprevious<CR>
map <F3> :bnext<CR>
map <F4> :bd<CR>
