""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable pathogen
call pathogen#infect()

filetype plugin indent on

" Have to place up here so the ruler displays on gVim in
" Windows -- csworn 2011.08.03
set ruler


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme base16-default-dark

syntax enable "Enable syntax highlighting
syntax on

set ffs=unix,dos,mac "Default file types
set encoding=utf8

try
    lang en_US
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab    "Use spaces instead of tabs
set smarttab
set shiftwidth=2 "1 tab == 2 spaces
set tabstop=2

set lbr   "Prevents word wrap from breaking words in the middle
set tw=80 "Enforces textwidth in buffer and also used by gq command

set nosi      "Turn off Smart indent to fix issues with commenting in Python
set wrap      "Wrap lines
set linebreak "Wrap lines at convenient points

" Disable auto-comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Fixes *most* yaml auto-indenting issues, still auto-indents on newlines
" Switched to using ft=ansible for yaml files in vim-ansible plugin
"autocmd FileType yaml setlocal sts=2 sw=2 ts=2 expandtab indentkeys-=<:>

" What to represent hidden characters as
set listchars=tab:▸\ ,eol:¬,trail:•
" Characters below don't show properly on Windows and I'm undecided on their
" usefulness
" Word wrap off, identifies when text beyond last column or precedes 1st column
"set listchars+=extends:»,precedes:«
" Shows ↪ at the beginning of wrapped lines
"set showbreak=↪


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This needs to be at the bottom to because it gets overrided by something
" above -- csworn 2011.08.03
" a - terse messages (like [+] instead of [Modified]
" t - truncate file names
" I - no intro message when starting vim fileless
set shortmess=It

" Set 7 lines to the curors - when moving vertical..
set so=7

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" Wild menu
set wildmenu
set wildmode=longest,list,full
"" Ignore these files during tab completion
""" Common
set wildignore+=.git,.hg,*.pdf,.svn,*.sw?,*.tmp,*.zip
""" OSX/Linux
set wildignore+=.DS_Store,*.so
""" Windows
set wildignore+=*.dll,*.doc*,*.exe,*.xls*

" Turn on line numbering
set number
" Turn on line relative line numbering
set relativenumber
" Turn on sign column that is used to place signs next to lines of interest
set signcolumn=yes

" Set backspace config
set backspace=eol,start,indent

" Give more space for displaying messages
set cmdheight=2

" Searching
set nohlsearch   "Turn off highlighted items after search is complete
set incsearch    "Make search act like search in modern browsers
set ignorecase   "Ignore case when searching
set smartcase    "Overrides ignore case if search pattern has upper case chars
set magic        "Set magic on, for regular expressions

set showmatch    "Show matching bracets when text indicator is over them
set mat=2        "How many tenths of a second to blink

" Folding
" Found syntax produced better results than indent but performance would suck
" when dealing large chef roles because of all the nested hashes
"set foldmethod=syntax
"set foldmethod=indent
" Going to have folding as something I enable manually for now
set nofoldenable        "dont fold by default when opening files

" remember lotsa fun stuff
" Commented out for Neovim per https://vi.stackexchange.com/questions/10028/e576-failed-to-parse-shada-file-extra-bytes-in-msgpack-string-at-position-3
"set viminfo='1000,f1,/50,:50,<50,n~/.viminfo

" Show the demarcation line that we dare not cross or even go into!
set colorcolumn=81

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=8

" How splits should open by default
set nosplitbelow
set splitright

" Default is 4000ms (4 seconds) which can lead to delays & poor user experience
set updatetime=50


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => STATUS LINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=3 " Show only one status line with the active buffer info


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PERFORMANCE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set lazyredraw
set nocursorcolumn

" Vim should enable ttyfast if xterm is used by this may not happen when
" tmux is used depending on the term used by tmux.  We'll turn it on by default
set ttyfast

" nocursorline is recommended but I like it so I'll keep it here just as a
" reminder to turn it off if vim gets slow
set cursorline


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COMMAND MODE MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" More convenient way to move to beginning or end of line
noremap H ^
noremap L $
vnoremap L g_

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => INSERT MODE MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cycle through autocomplete options using tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-g>u\<Tab>"

" A much easier way of pressing Escape in insert mode
inoremap kj <esc>

" Save and remain in insert mode
inoremap <F2> <C-o>:w<cr>
" inoremap df <C-o>:w<cr> "This causes a delay when typing pdf

" Save and exit insert mode
inoremap <F3> <esc>:w<cr>
" inoremap fd <esc>:w<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LEADER MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader setings (needs to be above any other use of <Leader>)
let mapleader = ","

" <tab>
"" Use tab to jump between enclosures
map <tab> %

" <space>
"" Clear highlighted searches
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" b
"" Buffer navigation
""" Toggle between last used buffers
"""" Notice how its the ^ and not 6
map <Leader>bt <C-^>
map <Leader>bd :bd<CR>
""" Buffer Surfer
nmap <Leader>bb :BufSurfBack<CR>
nmap <Leader>bf :BufSurfForward<CR>

" B
"" Buffer navigation
""" Delete the buffer but don't close window
map <Leader>Bd :Bd<CR>

" c
"" Window mappings
""" Close current window
map <Leader>cq <C-W>c
""" Close top window
map <Leader>ck <C-W>k<C-W>c
""" Close bottom window
map <Leader>cj <C-W>j<C-W>c
""" Close right window
map <Leader>ch <C-W>h<C-W>c
""" Close left window
map <Leader>cl <C-W>l<C-W>c

" d
"" Diffing
map <Leader>do :windo diffthis<CR>
map <leader>dc :diffoff!<CR>
map <leader>du :diffupdate<CR>

" e
"" Opening files
""" vimrc
map <Leader>evl :e ~/.vimrc<CR>
map <Leader>evw :e ~\_vimrc<CR>

" f
map <leader>fi :setlocal foldmethod=indent<CR>
map <leader>fs :setlocal foldmethod=syntax<CR>

" l
"" Disable color column
"" I don't use these and <leader>l is mapped to Location List for now
""map <Leader>l :setlocal colorcolumn=80<CR>
""map <Leader>ll :setlocal colorcolumn=0<CR>
"" Toggle list hidden characters
map <Leader>lc :set list!<CR>
nmap <script> <leader>ll :call ToggleLocationList()<CR>

" m
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" n

" N
"" Toggle line numbers
map <Leader>N :setlocal number!<CR>

" p
"" ctrl-p mappings
map <leader>pb :CtrlPBuffer<CR>
map <leader>pm :CtrlPMRU<CR>
map <leader>pt :CtrlPTag<CR>
"" Search Files
map <leader>pf :CtrlP<CR>
"" Search everything
map <leader>pp :CtrlPMixed<CR>

" P
"" prevents pasted text from getting auto-indented
"" but it breaks auto indent and other features when enabled
map <Leader>P :setlocal paste!<CR>

" q
"" Not needed because of toggle implemented by togglelist plugin
""map <leader>qo :copen<CR>
""map <leader>qc :cclose<CR>
nmap <script> <leader>qq :call ToggleQuickfixList()<CR>

" r
map <leader>rr :w<CR>:!ruby %<CR>
map <leader>rp :w<CR>:!python %<CR>
"" Reload vimrc
map <leader>rv :source $MYVIMRC<CR>

" s
nnoremap <leader>ss :w<cr>
"" Save while in insert mode
inoremap <leader>ss <C-c>:w<cr>

" t
map <leader>tc :tabc<CR>
map <leader>te :tabe<CR>
map <leader>tf :tabf<CR>
map <leader>tl :tabl<CR>
map <leader>tn :tabn<CR>
map <leader>tp :tabp<CR>
map <leader>tt :TagbarToggle<CR>

" T
map <leader>TT :TlistToggle<CR>

" v
"" Vimux mappings
map <Leader>vr :call VimuxRunCommand("clear; ls -l " . bufname("%"))<CR>
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
map <Leader>vz :call VimuxZoomRunner()<CR>

" w
"" Change working directories
""" Non-work specific directories
"""" Set CWD to the directory of the currently open file
map <Leader>wcc :cd %:p:h<CR>
""" Specific directories
map <Leader>wwr :cd c:\repos<CR>

" W
"" Toggle word wrap
map <Leader>W :setlocal wrap!<CR>

" ]
"" Quickfix list
map ]q :cnext<CR>
map ]Q :clast<CR>

" [
"" Quickfix list
map [q :cprev<CR>
map [Q :cfirst<CR>
map <Leader>bf :BufSurfForward<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=* As execute "Ack!" '<args>'
command! -nargs=* Af execute "AckFile!" '<args>'
command! -nargs=* Fs execute "CtrlSF" '<args>'
command! -nargs=* Ff execute "CtrlSF -filematch" '<args>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

" Prevent ~ swap swp backup files from getting written
" Preferable to set updatecount=0 because you still
" get a .swp that lets you know the file is already
" opened
set nobackup


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGIN SPECIFIC SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack
let g:ack_autofold_results = 1
let g:ackpreview = 1
let g:ack_autoclose = 1
let g:ackhighlight = 1

" Airline
let g:airline_theme='badwolf'
"let g:airline_theme='base16_shell'
"let g:airline_theme='owo'

" Airline supports creating sections using statusline items or using 'parts'
" which are keywords unique to Airline that will show specific metadata
" Section using statusline items (:help airline-customization)
" :help statusline for a list of statusline items
let g:airline_section_c = '[%n] %F%m%r'
" Section using parts (:help airline-advanced-customization)
let g:airline_section_y = airline#section#create_left(['%{getcwd()}', 'ffenc'])
let g:airline_section_z = '%l:%v %3p%%/%L'
" Configure the layout of the sections using the 2 arrays below
" 1st array is for left-side sections and 2nd array is for right-side sections
" (:help airline-default)
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'error', 'warning', 'y', 'x', 'z' ] ]
" Show buffers in the tab bar if no tabs are open.  Enabling this breaks
" showing the tab index number in the tab bar if tabs are created
"let g:airline#extensions#tabline#enabled = 1
" Show buffer numbers if buffers are in the tab bar
"let g:airline#extensions#tabline#buffer_nr_show = 1
" Show only the filename of the buffer in a tab
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#wordcount#enabled = 0

" AutoComplPop
let g:acp_behaviorKeywordLength = 3

" Ag
let g:aghighlight=1

" CtrlP
"" Enable tag mode in CtrlP
let g:ctrlp_extensions = ['tag']
"" Setting to 0 tells CtrlP to use CWD
let g:ctrlp_working_path_mode = 0

" lightline
" let g:lightline = {
"       \ 'colorscheme': 'nord',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste', 'gitbranch' ],
"       \             [ 'filename', 'readonly', 'modified' ] ],
"       \   'right': [ [ 'cwd', 'fileformat', 'fileencoding', 'filetype',
"       \                'lineinfo', 'percent' ] ]
"       \ },
"       \ 'component': {
"       \   'cwd': '%{getcwd()}',
"       \   'filename': '[%n] %t',
"       \   'percent': '%3p%%/%L',
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'FugitiveHead'
"       \ },
"       \ }

" Taglist
"" Place taglist on the right side
let Tlist_Use_Right_Window = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALLOW FOR LOCAL OVERRIDES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
