set columns=180
set lines=90
set nocompatible
set history=150
set undolevels=100
set ruler
set autoread " auto read when file is changed from outside
set linebreak
set nolist
set linespace=0
set cursorline
set nofoldenable
set ic
set number
set numberwidth=4
set title
set showmode
set nobomb
set nostartofline
set laststatus=2 "black status line at bottom of window
set clipboard+=unnamed
set splitright
set splitbelow
set scrolloff=3
set switchbuf=useopen
set showtabline=2
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
"set fileformat=unix
"set fileformats=unix,dos

"" Unicode support
" enc 內部編碼
  set encoding=utf-8
" fenc 檔案編碼 
  set fileencodings=utf-8,big5,cp950,euc-jp,gbk,euc-kr,utf-bom,iso8859-1,utf-16le
" tenc Terminal 編碼
  set tenc=utf-8

  set fenc=utf-8 enc=utf-8 
  scriptencoding utf-8

" ignores
set wildignore+=*.o,*.obj,*.pyc                " output objects
set wildignore+=*.png,*.jpg,*.gif,*.ico        " image format
set wildignore+=*.swf,*.fla                    " image format
set wildignore+=*.mp3,*.mp4,*.avi,*.mkv        " media format
set wildignore+=*.git*,*.hg*,*.svn*            " version control system
set wildignore+=*sass-cache*
set wildignore+=*.DS_Store
set wildignore+=log/**
set wildignore+=tmp/**


" cursorline switched while focus is switched to another split window
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" next and prev tab
noremap <F7> gT
noremap <F8> gt

" identation
nmap <TAB> v>
nmap <S-TAB> v<
vmap <TAB> >gv
vmap <S-TAB> <gv

" quick open vimrc in a new tab
nmap <leader>v :tabe $MYVIMRC<CR>
map <leader>0 :topleft 100 :split README.md<CR>

"font
"set gfn=Dina:h9 gfw=MingLiU:h11
"colorscheme
"color billw
"
set background=dark
colorscheme solarized

"colorscheme rails_envy
"color ir_black
"color codeschool
"color jellybeans
"color darkblue

"Comment
if ! has ('gui')
    highlight Comment ctermfg=gray ctermbg=darkblue
else 
    highlight Comment guifg=gray guibg=darkblue
    au InsertLeave * hi Cursor guibg=red
    au InsertEnter * hi Cursor guibg=green
endif

"solarized
if has('gui_running')
  set background=dark "light
else
  set background=dark
endif

"CursorLine
"hi CursorLine guibg=#25587e
"hi TabLine          guifg=#414141     guibg=#000000  gui=none
"hi TabLineFill      guifg=#f6f3e8     guibg=#202020  gui=none
"hi TabLineSel       guifg=#f6f3e8     guibg=#414141  gui=none 

" disable sound on errors
set visualbell
set noerrorbells
set t_vb=
set tm=500

"set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
"set statusline+=\ \ \ [%{&ff}/%Y]
"set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
"set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

" ===============================
" custom key and plugin configurations
" ===============================
" select ALL
map <c-a> ggVG

" run scripts
autocmd BufRead,BufNewFile *.py map <D-CR> :% w !python<CR>


" vimrc statusline show current date and time
"set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

"if has("win32")
"  set statusline=%<%f%h%m%r%=%{strftime(\"%I:%M:%S\ \%p,\ %a\ %b\ %d,\ %Y\")}\ %{&ff}\ %l,%c%V\ %P
"else
"  set statusline=%<%f%h%m%r%=%{strftime(\"%l:%M:%S\ \%p,\ %a\ %b\ %d,\ %Y\")}\ %{&ff}\ %l,%c%V\ %P
"endif

"set pheader=%<%f%h%m\ %40{strftime(\"%c\",getftime(expand(\"%%\")))}%=Page\ %N

"key mapping
let mapleader = ","

map <C-S> :w<CR>
map! <C-S><ESC> :w<CR>

map <C-A> ggVG<CR>

"autocomplpop
let g:acp_completeOption = '.,w,b,u,t,i,k'
"let g:acp_behaviorSnipmateLength=0 " 同時snipMate.vim 也要修改加入一個函式


"EasyTags
let g:easytags_cmd = '/usr/local/bin/ctags'
let g:easytags_dynamic_files = 1
let g:easytags_updatetime_autodisable = 1
let g:easytags_updatetime_min = 10000
let g:easytags_on_cursorhold = 0

"minibufexpl.vim
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1   "" If you use other explorers like TagList you can (As of 6.2.8) set it at 1
let g:miniBufExplUseSingleClick = 1 "" If you would like to single click on tabs rather than double clicking on them to goto the selected buffer.
highlight MBEVisibleNormal term=bold cterm=bold gui=bold guibg=LightBlue guifg=White "" Buffers that have NOT CHANGED and are VISIBLE
highlight MBEVisibleChanged term=bold cterm=bold gui=bold guibg=LightRed guifg=White "" Buffers that have CHANGED and ar




""taglist.vim
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
nnoremap <silent> <F3> :TlistToggle<CR>
let Tlist_Show_One_File = 1     
let Tlist_Use_Right_Window = 0 
let Tlist_WinWidth = 30
let Tlist_Sort_Type = "name"    
let tlist_objc_settings = 'objc;i:interface;c:class;m:method;p:property'

""tagbar
"nmap <silent> <F3> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_width = 30
let g:tagbar_left = 1
let g:tagbar_objc_settings = 'objc;i:interface;c:class;m:method;p:property'

""autocmd
autocmd BufRead,BufNewFile *.mm :set ft=objc

""Command-T
"let g:CommandTMaxFiles=20000
"nnoremap <silent> <F2> :CommandT<CR>
"nnoremap <silent> <F1> :CommandTBuffer<CR>

""Source Explorer settings
let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
let g:SrcExpl_updateTagsKey = "<F12>"
nnoremap <silent> <F8> :SrcExplToggle<CR>



" enable omni completion. (ctrl-x ctrl-o)
  set cot=menuone,preview
  autocmd insertleave * if pumvisible() == 0|pclose|endif
  autocmd filetype html,markdown setlocal omnifunc=htmlcomplete#Completetags
  autocmd filetype javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd filetype python setlocal omnifunc=pythoncomplete#Complete
  autocmd filetype xml setlocal omnifunc=xmlcomplete#completetags
  autocmd filetype css set omnifunc=csscomplete#CompleteCSS
  autocmd filetype c set omnifunc=ccomplete#Complete
  autocmd filetype java set omnifunc=javacomplete#Complete
  autocmd filetype php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType ruby set omnifunc=rubycomplete#Complete

  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_classes_in_global = 1
  let g:rubycomplete_rails = 1


  " use syntax complete if nothing else available
  if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
          \	if &omnifunc == "" |
          \		setlocal omnifunc=syntaxcomplete#Complete |
          \	endif
  endif


  " make CSS omnicompletion work for SASS and SCSS
  autocmd BufNewFile,BufRead *.scss             set ft=scss.css
  autocmd BufNewFile,BufRead *.sass             set ft=sass.css

" Ruby
if executable("ruby")
  autocmd BufRead,BufNewFile *.rb map <F5> :% w !ruby -w<CR>
else
  autocmd BufRead,BufNewFile *.rb map <F5> :echo "you need to install Ruby first!"<CR>
endif

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

