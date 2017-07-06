" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.set nocompatible
set nocompatible

" ================ General Config ====================
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=100                 "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set nocursorline                  "Highlight line with cursor
set pastetoggle=<F5>            "Normal text paste
set conceallevel=0 " Don't hide quotes in json
set showtabline=2
set laststatus=2
set mouse=a
" set relativenumber
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber
set nocursorcolumn
set nocursorline
set norelativenumber
" syntax sync minlines=256
set lazyredraw     "Test for speed
set ttyfast        "Faster terminal
set timeoutlen=1000 ttimeoutlen=0 "Fix lightline
set hidden

" set clipboard+=unnamedplus

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

set termguicolors
" set t_Co=256
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_contrast_light = 'soft'
" let g:gruvbox_italic = 1
set background=dark
colorscheme gruvbox
" colorscheme tender

" ================ Statusline config ================
"
" set statusline=%F%m%r%h%w\ [%l/%L,\ %v]\ [%p%%]\ %=[TYPE=%Y]\ [FMT=%{&ff}]\ %{\"[ENC=\".(&fenc==\"\"?&enc:&fenc).\"]\"}
"
" ================ Turn Off Swap Files ==============

" set noswapfile
" set nobackup
" set nowb

set backup                     " Enable creation of backup file.
set backupdir=~/.vim/backups   " Where backups will go.
set directory=~/.vim/tmp       " Where temporary files will go.

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif
" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on
" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set wrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" Enable russian lang
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Red

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" ## Edit .vimrc ##
map <leader>v :vsp $MYVIMRC<CR>
map <leader>V :source $MYVIMRC<CR>
" ================ Folds ============================
"
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================
"
" set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
" set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
" set wildignore+=*vim/backups*
" set wildignore+=*sass-cache*
" set wildignore+=*DS_Store*
" set wildignore+=vendor/rails/**
" set wildignore+=vendor/cache/**
" set wildignore+=*.gem
" set wildignore+=log/**
" set wildignore+=tmp/**
" set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================
"
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================
"
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" Status line
" set laststatus=2
" set statusline=
" set statusline+=%-3.3n\                      " buffer number
" set statusline+=%f\                          " filename
" set statusline+=%h%m%r%w                     " status flags
" set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
" set statusline+=%=                           " right align remainder
" set statusline+=0x%-8B                       " character value
" set statusline+=%-14(%l,%c%V%)               " line, character
" set statusline+=%<%P                         " file position

" ================ Other settings ===================
call plug#begin()

  " Plug 'hail2u/vim-css3-syntax'         " Slim support
  " Plug 'arakashic/chromatica.nvim'
  " Plug 'vim-syntastic/syntastic'
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'tpope/vim-haml'
  Plug 'Yggdroot/indentLine'            " Indent Guides
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'mattn/emmet-vim'                " Emmet support
  Plug 'tpope/vim-surround'             " Quotes and tags edit LEARN!
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'matchit.zip'
  Plug 'Raimondi/delimitMate'
    let delimitMate_expand_cr = 1
  Plug 'kien/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'gregsexton/MatchTag'
  Plug 'jacoborus/tender.vim'
  Plug 'tpope/vim-fugitive'

  " Plug 'MarcWeber/vim-addon-mw-utils'
  " Plug 'tomtom/tlib_vim'
  " Plug 'garbas/vim-snipmate'
  " Plug 'honza/vim-snippets'

  Plug 'tpope/vim-endwise'


" Commented plugins

" Plug 'jiangmiao/auto-pairs'
" Plug 'mxw/vim-jsx'
"   let g:jsx_ext_required = 0
" Plug 'Chiel92/vim-autoformat'
" Plug 'slim-template/vim-slim',   { 'for': [ 'slim' ] }         " Slim support
" Plug 'itchyny/lightline.vim'          " Airline
" Plug 'takac/vim-hardtime'
"   let g:hardtime_default_on = 1
"   let g:hardtime_allow_different_key = 1
"   let g:hardtime_ignore_buffer_patterns = [ "NERD.*", "CtrlP.*" ]
" Plug 'lyokha/vim-xkbswitch'
"   let g:XkbSwitchEnabled = 1
" Plug 'tpope/vim-fugitive'
" Plugin 'lilydjwg/colorizer'             " Colors in CSS
" Plugin 'sickill/vim-monokai'            " Monokai theme
" Plugin 'shougo/unite.vim'
" Plug 'FelikZ/ctrlp-py-matcher'          " Spped up CtrlP Search
" Plugin 'keith/investigate.vim'          " Ruby Docs LEARN!
" Plugin 'alpaca-tc/vim-endwise'          " End after if
" Plug 'easymotion/vim-easymotion'        " Easymotion LEARN!
" Plugin 'tpope/vim-fugitive'             " VIM GIT
" Autocomplete
" Plug 'maralla/completor.vim'
" Plug 'ajh17/VimCompletesMe'

call plug#end()

" let g:neocomplete#enable_at_startup = 1
" =============Indent Guides ================

let g:indentLine_enabled = 1
let g:indentLine_char= '┆'

"================ CtrlP config ===========

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"================ Lightline config ===========
" let g:lightline = { 'colorscheme': 'gruvbox' }
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='tender'
" let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#left_alt_sep = ''
"
"=============== Autoformat ================

" noremap <F3> :Autoformat<CR>

" ================= Nerdtree ================
"
" autocmd vimenter * NERDTree "При загрузке вима включить дерево
" autocmd VimEnter * wincmd p "Переключение на активное окно при включении вим

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "Выход с одной q

map <leader><leader> :NERDTreeToggle<CR>
nmap <leader>m :NERDTreeFind<CR>

"
" ================= Keymaps ================
"noremap <silent> ,z :tabp<CR> "Change tabs
"noremap <silent> ,x :tabn<CR>

"noremap <C-F> :CtrlP<CR>


"Save SUDO files
" cnoremap sudow w !sudo tee % >/dev/null
cnoremap sudow w !sudo tee % >/dev/null

" Allow to copy/paste between VIM instances
" "copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
" "copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
" "paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>


" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
nnoremap <silent> <bs> <C-w><Left>

" Save with leaderkey
noremap <Leader>w :update<CR>


" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>
" ============= Ruby Helpers ===============


" create <%= foo %> erb tags using Ctrl-k in edit mode
imap <silent> <C-K> <%=   %><Esc>3hi

" create <% foo %> erb tags using Ctrl-j in edit mode
imap <silent> <C-J> <%  %><Esc>2hi

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

"(v)im (c)ommand - execute current line as a vim command
nmap <silent> ,vc yy:<C-f>p<C-c><CR>

""(v)im (r)eload
nmap <silent> ,vr :so ~/.vimrc<CR>
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" let g:syntastic_scss_checkers = ['scss_lint']
" let g:syntastic_check_on_open = 1
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" =============== NeoComplete ================
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType css,scss,sass set omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" ============== Easymotion ==================
" silent! map <F4> <Leader><Leader>e
" silent! map <F3> <Leader><Leader>w
" silent! map <F2> <Leader><Leader>b
" silent! map <F1> <Leader><Leader>f
