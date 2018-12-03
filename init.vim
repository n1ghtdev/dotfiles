execute pathogen#infect()
syntax on
let mapleader = '\'
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme jellybeans
let g:airline_theme='luna' "vi'
let g:ycm_server_python_interpreter = 'python'
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
set encoding=utf8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1

set title
set mouse=a
set number
set cursorline
set gdefault
set guicursor=
set gcr=a:blinkon0
set numberwidth=1
set tabstop=2 shiftwidth=2 expandtab
set clipboard+=unnamedplus
set pastetoggle=<f6>
set nopaste
set noshowmode
set nostartofline
set timeout timeoutlen=500 ttimeoutlen=0
set lazyredraw
set hidden
set conceallevel=2 concealcursor=i
set pumheight=15
set tagcase=smart
set updatetime=500
set synmaxcol=300
set shortmess+=c
set undofile
set completeopt-=preview
set noswapfile
set nobackup
set nowb
set nowritebackup
set backspace=2
set backspace=indent,eol,start
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set linebreak
set mps+=<:>
set showmatch
set confirm
highlight SpellBad ctermfg=Black ctermbg=Red
"highlight NERDTreeFile ctermfg=251

set smartindent
set autoindent
set smarttab
set breakindent

set sessionoptions=curdir,buffers,tabpages
set smartcase
set ignorecase

set showcmd
set ruler
set browsedir=current
set clipboard=unnamed

filetype on
filetype plugin on
filetype plugin indent on

set wildmenu
set wildmode=full
set autoread
set updatetime=500

set laststatus=2
set nowrap

au BufLeave * if !&diff | let b:winview = winsaveview() | endif
au BufEnter * if exists('b:winview') && !&diff | call winrestview(b:winview) | unlet! b:winview | endif
" Close vim if only nerdtree left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd FileType nerdtree noremap <buffer> <Tab> <nop>

set fillchars+=stl:\ ,stlnc:\
hi VertSplit cterm=NONE
set splitbelow splitright

"binds
"" NERDTree configuration
noremap <F3> :NERDTreeToggle<CR>
"f4 - save file
nmap <F4> :w<cr>
vmap <F4> <esc>:w<cr>i
imap <F4> <esc>:w<cr>i
"c-1 prev / c-3 next
map <C-[> :tabprev<CR>
map <C-]> :tabnext<CR>
"f11 - numeric rows
imap <F11> <Esc>:set<Space>nu!<CR>a
nmap <F11> :set<Space>nu!<CR>
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>
nmap <C-q> :Bclose<cr>:tabclose<cr>
imap <C-q> <ESC>:Bclose<cr>:tabclose<cr>
"row duplication
imap <C-d> <esc>yypi
"auto-completion
inoremap <C-space> <C-x><C-o>
"move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
augroup nerdtreedisablecursorline
	autocmd!
	autocmd FileType nerdtree setlocal nocursorline
augroup end

"Plugins setups
" == NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowBookmarks = 0
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 30
let NERDTreeChDirMode = 2
let NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = "+"
let g:NERDTreeDirArrowCollapsible = "~"
" == jsx
let g:jsx_ext_required = 1
" == Airline
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_section_z = airline#section#create(['windowswap', '%3p%%', 'linenr', ':%3v'])
" Hide error/warning sections
let g:airline_section_error = ''
let g:airline_section_warning= ''
let g:bufferline_echo = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''

" Don't close window, when deleting buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
