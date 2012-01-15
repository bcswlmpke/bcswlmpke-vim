call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
set history = 50
set undolevels = 100
set ruler
set autoread " auto read when file is changed from outside
set linespace = 0
set cursorline
set nofoldenable
set number
set numberwidth = 5
set title
set showmode
set nobomb
set nostartofline

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

syntax on		" syntax highlight
set hlsearch		" search highlighting
syntax enable
color darkblue
set t_Co = 256

set nobackup		" no *~ backup files
set noswapfile
set nowb
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		"
set smarttab		" insert tabs on the start of a line according to
set expandtab        "replace <TAB> with spaces
set softtabstop=2
set shiftwidth=2
au FileType Makefile set noexpandtab

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


" NERDTree
nnoremap <silent> <F2> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks  = 1

" easy motion
let g:EasyMotion_leader_key = '<Leader>'

" mini buffer explorer
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow= 1
noremap <F3> :TMiniBufExplorer<cr>
noremap <F7> :bp<cr>
noremap <F8> :bn<cr>

" run scripts
autocmd BufRead,BufNewFile *.rb map <D-CR> :% w !ruby<CR>
autocmd BufRead,BufNewFile *.py map <D-CR> :% w !python<CR>







