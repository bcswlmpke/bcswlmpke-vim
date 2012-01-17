call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set columns=120
set lines=40
set nocompatible
set history=50
set undolevels=100
set ruler
set autoread " auto read when file is changed from outside
set linespace=0
set cursorline
set nofoldenable
set ic
set number
set numberwidth=5
set title
set showmode
set nobomb
set nostartofline
set autoindent
set smartindent
set cindent
set backspace=2
"set backspace=indent,eol,start
set showmatch
set langmenu=none

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

syntax on		" syntax highlight
set hlsearch		" search highlighting
set incsearch
syntax enable
set t_Co=256

set nobackup		" no *~ backup files
set noswapfile
set nowb
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		"
set smarttab		" insert tabs on the start of a line according to
set expandtab        "replace <TAB> with spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
au FileType Makefile set noexpandtab
set nowrap
set updatetime=500
set hidden

" File format
set fileformat=unix
set fileformats=unix,dos

"" Unicode support
if ( 1 )
" fenc 檔案編碼 
  set fileencodings=utf-8,big5,cp950,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
" enc 內部編碼
  set encoding=utf8
" tenc Terminal 編碼
  set tenc=utf8
endif

"font
"set gfn=Dina:h9 gfw=MingLiU:h11

"colorscheme
color billw
"set background = dark
"colorscheme solarized

"Comment
if ! has ('gui')
    highlight Comment ctermfg=gray ctermbg=darkblue
else 
    highlight Comment guifg=gray guibg=darkblue
endif

"CursorLine
hi CursorLine guibg=#25587e
hi TabLine          guifg=#414141     guibg=#000000  gui=none
hi TabLineFill      guifg=#f6f3e8     guibg=#202020  gui=none
hi TabLineSel       guifg=#f6f3e8     guibg=#414141  gui=none 

" disable sound on errors
set visualbell
set noerrorbells
set t_vb=
set tm=500

set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
  let curdir = substitute(getcwd(), $HOME, "~", "")
  return curdir
endfunction

function! HasPaste()
  if &paste
    return '[PASTE]'
  else
    return ''
  endif
endfunction

set encoding=utf-8
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1,euc-jp,utf-16le
set fenc=utf-8 enc=utf-8 tenc=utf-8

augroup filetypedetect
  au! BufNewFile,BufRead *.as  setf actionscript
  au! BufNewFile,BufRead *.m setf objc
augroup END

" ===============================
" custom key and plugin configurations
" ===============================
" select ALL
map <c-a> ggVG

" run scripts
autocmd BufRead,BufNewFile *.rb map <D-CR> :% w !ruby<CR>
autocmd BufRead,BufNewFile *.py map <D-CR> :% w !python<CR>


" vimrc statusline show current date and time
set laststatus=2 "black status line at bottom of window
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

if has("win32")
  set statusline=%<%f%h%m%r%=%{strftime(\"%I:%M:%S\ \%p,\ %a\ %b\ %d,\ %Y\")}\ %{&ff}\ %l,%c%V\ %P
else
  set statusline=%<%f%h%m%r%=%{strftime(\"%l:%M:%S\ \%p,\ %a\ %b\ %d,\ %Y\")}\ %{&ff}\ %l,%c%V\ %P
endif

set pheader=%<%f%h%m\ %40{strftime(\"%c\",getftime(expand(\"%%\")))}%=Page\ %N







"key mapping
let mapleader = ","

map <C-S> :w<CR>
map! <C-S><ESC> :w<CR>

map <C-A> ggVG<CR>

"easymotion
let g:EasyMotion_leader_key = ","

"minibufexpl.vim
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1   "" If you use other explorers like TagList you can (As of 6.2.8) set it at 1
let g:miniBufExplUseSingleClick = 1 "" If you would like to single click on tabs rather than double clicking on them to goto the selected buffer.
highlight MBEVisibleNormal term=bold cterm=bold gui=bold guibg=LightBlue guifg=White "" Buffers that have NOT CHANGED and are VISIBLE
highlight MBEVisibleChanged term=bold cterm=bold gui=bold guibg=LightRed guifg=White "" Buffers that have CHANGED and ar

"NERDTree
let g:NERDTreeWinPos = "right"
nnoremap <silent> <F4> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks = 1
"nmap <leader>n :NERDTreeToggle<CR>
"map <F4> :NERDTreeToggle<CR>



""taglist.vim
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
"nnoremap <silent> <F3> :TlistToggle<CR>
let Tlist_Show_One_File = 1     
let Tlist_Use_Right_Window = 0 
let Tlist_WinWidth = 30
let Tlist_Sort_Type = "name"    
let tlist_objc_settings = 'objc;i:interface;c:class;m:method;p:property'

""tagbar
nmap <silent> <F3> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_width = 30
let g:tagbar_left = 1
let g:tagbar_objc_settings = 'objc;i:interface;c:class;m:method;p:property'

""autocmd
autocmd BufRead,BufNewFile *.mm :set ft=objc

""Command-T
let g:CommandTMaxFiles=20000
nnoremap <silent> <F2> :CommandT<CR>
nnoremap <silent> <F1> :CommandTBuffer<CR>






