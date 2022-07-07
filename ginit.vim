""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Microsoft Windows specific settings
if has('win32')
  " Required for Neovim to copy & paste on Windows per https://github.com/equalsraf/neovim-qt/issues/327
  source $VIMRUNTIME/mswin.vim
endif

" Enable Mouse
set mouse=a

" Use the system clipboard by default
"set clipboard^=unnamed,unnamedplus

" " Right Click Context Menu (Copy-Cut-Paste)
" nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
" inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
" xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
" snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

" " Set Editor Font
" if exists(':GuiFont')
"     " Use GuiFont! to ignore font errors
"     GuiFont! Consolas:h14
" endif

" " Disable GUI Tabline
" if exists(':GuiTabline')
"     GuiTabline 0
" endif

" " Disable GUI Popupmenu
" if exists(':GuiPopupmenu')
"     GuiPopupmenu 0
" endif

" " Enable GUI ScrollBar
" if exists(':GuiScrollBar')
"     GuiScrollBar 1
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme base16-default-dark

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=l  "remove left-hand scroll bar


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guitablabel=%t
