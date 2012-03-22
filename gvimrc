if has("gui_macvim") && has("gui_running")
  set guifont=Monaco:h14
  set transparency=2
  set guioptions=aAce
  set antialias
  set clipboard+=unnamed
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>
  " Change to NERDTree's root dir
  "set autochdir
  let NERDTreeChDirMode=2

  " map cmd+1~9 to switch tab 1~9
  for i in range(1, 9)
    exec "nnoremap <D-".i."> ".i."gt"
  endfor

  " command-T
  set wildignore+=*.o,*.obj,.git,*.pyc,*.jpg,*.png,*.gif

  " ctags path
"  let Tlist_Ctags_Cmd = '/usr/local/Cellar/ctags/5.8/bin/ctags'
"  let Tlist_WinWidth = 40
"  map <F4> :TlistToggle<cr>
endif
