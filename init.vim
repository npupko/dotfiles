" vim/neovim config used by Nikita Pupko
" Author: Nikita Pupko
" http://github.com/Random4405/dotfiles
" General Config {{{
autocmd!
set nocompatible
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
set nocursorline
set relativenumber
set updatetime=250 " decreasing updatetime
set synmaxcol=1200
set fillchars+=vert:│
set nojoinspaces " Use only 1 space after '.' when joining lines instead of 2
set tags=./tags;,tags;
lang en_US.UTF-8
" set encoding=UTF-8
" syntax sync minlines=256
" set lazyredraw     " Test for speed
" set ttyfast        " Faster terminal
set timeoutlen=1000 ttimeoutlen=0 " Fix lightline
set hidden
set clipboard=unnamed " Use system clipboard

" let g:python3_host_prog = '/usr/local/bin/python3'
" let g:loaded_python3_provider=1

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
let mapleader=","
"}}}
" Statusline config {{{
" set statusline=%F%m%r%h%w\ [%l/%L,\ %v]\ [%p%%]\ %=[TYPE=%Y]\ [FMT=%{&ff}]\ %{\"[ENC=\".(&fenc==\"\"?&enc:&fenc).\"]\"}
"
"Another status line
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
" }}}
" Font config {{{
set encoding=utf8
set guifont=Iosevka\ Term:h12
let g:airline_powerline_fonts = 1
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

filetype plugin on
filetype indent on
" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·,eol:¬
" set list listchars=trail:·,eol:¬
" set list listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮
" set list listchars=tab:>-,trail:.,extends:>
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
" }}}
" Folds {{{
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
" }}}
" Completion {{{
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
" set wildmode=list:longest,list:full # TODO: What the hell?
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
  Plug 'lifepillar/pgsql.vim'
  " Plug 'vim-ruby/vim-ruby'
  "   let g:ruby_host_prog = 'rvm @global do neovim-ruby-host'
  "   let g:ruby_operators = 1
  Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
  Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
  Plug 'morhetz/gruvbox'
  " Plug 'mhinz/vim-signify'
  Plug 'janko-m/vim-test', { 'on':  ['TestFile', 'TestNearest', 'TestSuite', 'TestLast', 'TestVisit'] }
  let test#strategy = "neovim"
    nmap <silent> <leader>tn :TestNearest<CR>
    nmap <silent> <leader>tf :TestFile<CR>
    nmap <silent> <leader>ts :TestSuite<CR>
    nmap <silent> <leader>tl :TestLast<CR>
    nmap <silent> <leader>tg :TestVisit<CR>
  Plug 'tmux-plugins/vim-tmux'
  Plug 'jparise/vim-graphql'
  Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'mxw/vim-jsx', { 'for': 'javascript' }
    let g:jsx_ext_required = 0
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer'}
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_key_invoke_completion = '<C-x><C-o>'
  Plug 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    let g:indent_guides_exclude_filetypes = ['haskell']
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
  " Plug 'keith/rspec.vim', { 'for': 'ruby' }                         " Rspec syntax
  Plug 'djoshea/vim-autoread'                                       " Reload changed files opened in vim
  Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }                                        " Ruby changes {} to do-end by '<leader>b'
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }                                          " CTags panel <F8>
  Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }         " CoffeScript syntax
  " Plug 'kshenoy/vim-signature'                                    " Vim better marks
  " Plug 'craigemery/vim-autotag'                                   " Autotag new files
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
  " Plug 'tpope/vim-eunuch'
    " let g:vim_markdown_conceal = 0
  Plug 'w0rp/ale'
  " , { 'on': 'ALEEnable' }                                                   " Auto linter
    let g:airline#extensions#ale#enabled = 1
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_enter = 0
    let g:ale_sign_error = 'E'
    let g:ale_sign_warning = 'W'

    " let g:ale_set_loclist = 0
    " let g:ale_set_quickfix = 1
    " let g:ale_open_list = 1

    hi link ALEErrorSign    GruvboxRed
    hi link ALEWarningSign  GruvboxYellow
  Plug 'qpkorr/vim-bufkill'                                         " Close buffer :BW
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'mileszs/ack.vim'
    if executable('ag')
      let g:ackprg = 'ag --vimgrep'
    endif
  " Plug 'vim-utils/vim-ruby-fold'
  " Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; python2 generate.py' }                 " Ansible syntax
    " let g:ansible_options = {'ignore_blank_lines': 0}
  " Plug 'ryanoasis/vim-devicons'
call plug#end()
" }}}
" Themes config {{{
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_italic = 1
let g:gruvbox_bold = 1
let g:gruvbox_terminal_colors = 1
let g:gruvbox_improved_strings = 0
set background=dark
colorscheme gruvbox

" let g:nofrils_heavylinenumbers = 0
" colorscheme nofrils-dark
" colorscheme phoenix
" PhoenixRed
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
" let g:airline_theme='tender'
let g:airline_theme='gruvbox'
" let g:airline_theme='minimalist'
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
"
" let g:airline#extensions#tabline#buffer_nr_format = '%s: '
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#show_buffers = 0
" let g:airline#extensions#tabline#show_close_button = 0
" let g:airline#extensions#tabline#show_tab_nr = 1
" let g:airline#extensions#tabline#tab_nr_type = 1
" let g:airline#extensions#tabline#left_alt_sep = ''
"}}}
"FZF Config {{{
" set rtp+=/usr/local/opt/fzf
" map <C-p> :FZF<cr>
" nmap ; :Buffers<CR>
" nmap <Leader>t :Tags<CR>
"}}}
" Keymaps {{{
" Save SUDO files
noremap <Leader>w :w !sudo tee % >/dev/null<CR>

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

" set ansible filetype
nmap <leader>a :set ft=ansible<CR>

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
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
augroup END

augroup nerdtree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

map <leader>d :call DeleteHiddenBuffers()<CR>

function! DeleteHiddenBuffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
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
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

set regexpengine=2

augroup vimrc
  autocmd!
  autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
augroup END

augroup env_syntax
  autocmd!
  autocmd BufNewFile,BufRead *.env.* set syntax=sh
augroup END


" Apply vimrc changes after save
" if has('nvim')
"   au BufWritePost init.vim so $MYVIMRC
" endif
" au BufWritePost .vimrc so $MYVIMRC
" }}}

" vim:foldmethod=marker:
