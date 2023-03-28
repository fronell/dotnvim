"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Custom GUI App Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('win32')
  " Required for Neovim to copy & paste on Windows per https://github.com/equalsraf/neovim-qt/issues/327#issuecomment-566131778
  source $VIMRUNTIME/mswin.vim
endif

if exists("g:neovide")
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => Neovide Settings
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Consolas chosen because its monospace & default font for VS Code
  set guifont=Consolas:h14
  " Lucida Console is a monospace alternative
  " set guifont=Lucida\ Console:h14
else
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => Neovim Qt Settings
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if exists(':GuiFont')
    " Consolas chosen because its monospace & default font for VS Code
    " Use GuiFont! to ignore font errors
    GuiFont Consolas:h14
    " Lucida Console is a monospace alternative
    " GuiFont Lucida\ Console:h14
  endif

  " GUI Options can be found at:
  " https://github.com/equalsraf/neovim-qt/blob/master/src/gui/runtime/doc/nvim_gui_shim.txt

  " Disable GUI Tabline
  if exists(':GuiTabline')
    GuiTabline 0
  endif

  " Enable GUI ScrollBar
  if exists(':GuiScrollBar')
    GuiScrollBar 1
  endif

  " Create a Native Looking Windows Right Click Context Menu (Copy-Cut-Paste)
  " Does not work with Neovide!
  nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
  inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
  xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
  snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable Mouse Support
set mouse=a
