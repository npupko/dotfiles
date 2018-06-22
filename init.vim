" vim/neovim config used by Nikita Pupko
" Author: Nikita Pupko
" http://github.com/Random4405/dotfiles
" General Config {{{
autocmd!
set nocompatible
set modeline                   " automatically setting options from modelines
set magic                      " For regular expressions turn magic on
set path=.,**                  " Directories to search when using gf
set number                     " Line numbers are good
set backspace=indent,eol,start " Allow backspace in insert mode
set history=100                " Store lots of :cmdline history
set showcmd                    " Show incomplete cmds down the bottom
set showmode                   " Show current mode down the bottom
set visualbell                 " No sounds
set autoread                   " Reload files changed outside vim
set nocursorline               " Highlight line with cursor
set pastetoggle=<F5>           " Normal text paste
set conceallevel=0             " Don't hide quotes in json
set showtabline=2
set laststatus=2
set mouse=a
set relativenumber
set nocursorcolumn
set updatetime=250             " decreasing updatetime
set synmaxcol=1000
set fillchars+=vert:│
set nojoinspaces               " Use only 1 space after '.' when joining lines instead of 2
set tags=./tags;,tags;
lang en_US.UTF-8
set encoding=UTF-8
" set lazyredraw     " Test for speed
" set ttyfast        " Faster terminal
set timeoutlen=1000 ttimeoutlen=0 " Fix lightline
set hidden
set clipboard=unnamed " Use system clipboard
set regexpengine=2 " Use new regexp engine

let g:ruby_host_prog = 'rvm system do neovim-ruby-host'

" turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
let mapleader=","
" }}}
" Completing {{{
set showfulltag
set complete=.                  " No wins, buffs, tags, include scanning
set completeopt=menuone         " Show menu even for one item
set completeopt+=noselect       " Do not select a match in the menu
" }}}
" Statusline config {{{
" set statusline=%F%m%r%h%w\ [%l/%L,\ %v]\ [%p%%]\ %=[TYPE=%Y]\ [FMT=%{&ff}]\ %{\"[ENC=\".(&fenc==\"\"?&enc:&fenc).\"]\"}
" }}}
" Font config {{{
set guifont=Iosevka\ Term:h12
" }}}
" Turn Off Swap Files {{{
set noswapfile
set nobackup
set nowb

" set backup                     " Enable creation of backup file.
" set backupdir=~/.vim/backups   " Where backups will go.
" set directory=~/.vim/tmp       " Where temporary files will go.
" }}}
" Persistent Undo {{{
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif
" }}}
" Indentation {{{
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
" nnoremap p p=`]<C-o>
" nnoremap P P=`]<C-o>

" filetype plugin on
" filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·,eol:¬
" set list listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
" }}}
" Folds {{{
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
" }}}
" Wildmenu {{{
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
" set wildmode=list:longest,list:full " TODO: What the hell?
" set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/* # TODO: What the hell?
" }}}
" Scrolling {{{
" set scrolloff=8         "Start scrolling when we're 8 lines away from margins
" set sidescrolloff=15
" set sidescroll=1
" }}}
" Search {{{
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
" }}}
" PluginsList {{{
call plug#begin()
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-ruby/vim-ruby'
  Plug 'lifepillar/pgsql.vim'
  Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
  Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
  Plug 'morhetz/gruvbox'
  Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'mxw/vim-jsx', { 'for': 'javascript' }
    let g:jsx_ext_required = 0
  " Plug 'Yggdroot/indentLine'
  Plug 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_guide_size = 1
    " let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
  Plug 'vim-airline/vim-airline'                                    " Airline
  Plug 'vim-airline/vim-airline-themes'                             " Airline themes
  Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'sass', 'scss'] }
  Plug 'vim-scripts/matchit.zip', { 'for': 'html' }                 " % moves for HTML
  Plug 'gregsexton/MatchTag', { 'for': 'html' }                     " Highlight HTML tags
  Plug 'Raimondi/delimitMate'                                       " Autoclosing quotes, parenthesis, brackets, etc
    let delimitMate_expand_cr = 1
  Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }           " File tree
    map <leader><leader> :NERDTreeToggle<CR>
    nmap <leader>m :NERDTreeFind<CR>
  Plug 'djoshea/vim-autoread'                                       " Reload changed files opened in vim
  Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }                     " Ruby changes {} to do-end by '<leader>b'
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }                                          " CTags panel <F8>
  Plug 'kchmck/vim-coffee-script'
  Plug 'tpope/vim-rails'                                            " TPope bundle start
  Plug 'tpope/vim-haml', { 'for': 'haml' }
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-markdown', { 'for': 'markdown' }
  Plug 'tpope/vim-liquid'
  Plug 'tpope/vim-rake'
  Plug 'tpope/vim-bundler'
  Plug 'w0rp/ale'
    let g:airline#extensions#ale#enabled = 1
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_enter = 0
    let g:ale_sign_error = 'E'
    let g:ale_sign_warning = 'W'

    hi link ALEErrorSign    GruvboxRed
    hi link ALEWarningSign  GruvboxYellow
  Plug 'qpkorr/vim-bufkill'                                         " Close buffer :BW
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'mileszs/ack.vim'
    if executable('ag')
      let g:ackprg = 'ag --vimgrep'
    endif
call plug#end()
" }}}
" Themes config {{{
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_italic = 1
let g:gruvbox_bold = 1
let g:gruvbox_terminal_colors = 1
let g:gruvbox_improved_strings = 0

" }}}
" Tagbar configuration {{{
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }
nmap <F8> :TagbarToggle<CR>
" }}}
" Indent Guides {{{
let g:indentLine_enabled = 1
let g:indentLine_char= '┆'
" }}}
" CtrlP config {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 1
endif
" }}}
" Airline config {{{
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#ctrlspace#enabled = 0
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_detect_iminsert=1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline_powerline_fonts = 1
"}}}
" Keymaps {{{
" Disable arrow movement, resize splits instead.
let g:elite_mode = 1
if get(g:, 'elite_mode')
  nnoremap <Up>    :resize +2<CR>
  nnoremap <Down>  :resize -2<CR>
  nnoremap <Left>  :vertical resize +2<CR>
  nnoremap <Right> :vertical resize -2<CR>
endif

" Allow misspellings
cnoreabbrev qw wq
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd

" Select blocks after indenting
xnoremap < <gv
xnoremap > >gv|

" Save SUDO files
cmap W!! w !sudo tee % >/dev/null
" noremap <Leader>w :w !sudo tee % >/dev/null<CR>

" Allow to copy/paste between VIM instances
" copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
" copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
" paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
nnoremap <silent> <bs> <C-w><Left>

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" Edit .vimrc
map <leader>v :e $MYVIMRC<CR>
map <leader>V :source $MYVIMRC<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" ROT13 Key
map <F3> ggVGg?

" Close Buffer
noremap <leader>q :BW<CR>
noremap <leader>Q :BW!<CR>

" Buffers list
" nnoremap ; :buffers<CR>:buffer<Space>
nnoremap \ :CtrlPBuffer<CR>

" This will copy the paragraph your cursor is on then paste a copy of it just below.
noremap cp yap<S-}>p

" Run macros qq with Q
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Exit from terminal window by Ctrl+O
if has('nvim')
  tmap <C-o> <C-\><C-n>
end

" Show next matched string at the center of screen
nnoremap n nzz
nnoremap N Nzz
" }}}
" Ruby Helpers {{{
" create <%= foo %> erb tags using Ctrl-k in edit mode
imap <silent> <C-K> <%=  %><Esc>2hi

" create <% foo %> erb tags using Ctrl-j in edit mode
imap <silent> <C-J> <%  %><Esc>2hi

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" }}}
" Autogroups and functions {{{
" Set colorcolumn for ruby files
augroup ruby
  au!
  autocmd FileType ruby,eruby set colorcolumn=81
augroup END

augroup nerdtree
  au!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

if has('autocmd')
  filetype indent plugin on

  " Shortcuts to quickly switch to common file types; handy when using
  " editing abstractions like sudoedit(8)
  nnoremap _cs :setlocal filetype=css<CR>
  nnoremap _co :setlocal filetype=coffee<CR>
  nnoremap _ht :setlocal filetype=html<CR>
  nnoremap _sl :setlocal filetype=slim<CR>
  nnoremap _js :setlocal filetype=javascript<CR>
  nnoremap _md :setlocal filetype=markdown<CR>
  nnoremap _rb :setlocal filetype=ruby<CR>
  nnoremap _sh :setlocal filetype=sh<CR>
  nnoremap _vi :setlocal filetype=vim<CR>
  nnoremap _an :setlocal filetype=ansible<CR>
endif

map <leader>d :call DeleteHiddenBuffers()<CR>

function! DeleteHiddenBuffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction

map <leader>/ :call AddPry()<CR>

function! AddPry()
  execute "normal obinding.pry\<Esc>"
endfunction

" Make those debugger statements painfully obvious
augroup debug
  au!
  au BufEnter *.rb syn match error contained "\<binding.pry\>"
  au BufEnter *.rb syn match error contained "\<debugger\>"
augroup END
" }}}
" Testing features {{{
vnoremap // y/<C-R>"<CR>
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

" Set augroup
augroup MyAutoCmd
  autocmd!
  autocmd CursorHold *? syntax sync minlines=300
augroup END

" augroup vimrc
"   autocmd!
"   autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
" augroup END

augroup filetypes
  autocmd!
  autocmd BufNewFile,BufRead *.env.* setfiletype sh
  autocmd Filetype gitcommit setlocal spell textwidth=72
augroup END

" vim:foldmethod=marker:
