" vim/neovim config used by Nikita Pupko
" Author: Nikita Pupko
" http://github.com/npupko/dotfiles
" General Config {{{
syntax on
set nofoldenable
set visualbell
set relativenumber
set inccommand=nosplit
set nocursorline
set nocursorcolumn
set number
set confirm
set showcmd
set encoding=UTF-8
set clipboard=unnamed
set laststatus=2
set signcolumn=auto
set autoread
set list listchars=tab:\ \ ,trail:·,eol:¬
set pastetoggle=<F5>
set showtabline=1
set nowrap

" Fuzzy matching
set path+=**                                                                " fuzzy matching with :find *.ext*
set wildmenu                                                                " Show list instead of just completing
set wildignore+=**/node_modules/**                                          " Ignore some folders
set wildignore+=**/.git/**
set wildignore+=**/build/**
set wildignore+=**/dist/**

set noswapfile
set nobackup
set nowb
" }}}

" Indentation {{{
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
" }}}


let mapleader = ","
lang en_US.UTF-8

call plug#begin()
  Plug 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_guide_size = 1
    let g:indent_guides_exclude_filetypes = ['help', 'defx']
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
    let g:NERDTreeNodeDelimiter = "\u00a0"
    map <leader><leader> :NERDTreeToggle<CR>
    nmap <leader>m :NERDTreeFind<CR>

  Plug 'vim-airline/vim-airline'
    let g:airline_powerline_fonts = 1
    let g:airline_skip_empty_sections = 1
    let g:airline#extensions#syntastic#enabled = 0
    let g:airline#extensions#ctrlspace#enabled = 0
    let g:airline#extensions#tmuxline#enabled = 0
    let g:airline#extensions#wordcount#enabled = 0
    let g:airline#extensions#keymap#enabled = 0
    let g:airline#extensions#ale#enabled = 1
    " Tabline
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_close_button = 0
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#show_buffers = 0
    let g:airline#extensions#tabline#tab_min_count = 2
  Plug 'vim-airline/vim-airline-themes'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
    let g:fzf_action = {
          \ 'ctrl-t': 'tab split',
          \ 'ctrl-s': 'split',
          \ 'ctrl-v': 'vsplit' }
     nnoremap <c-P> :Files<CR>
     nnoremap <c-\> :Buffers<CR>
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-haml', { 'for': 'haml' }
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-markdown', { 'for': 'markdown' }
  Plug 'tpope/vim-ragtag'
  Plug 'morhetz/gruvbox'
  Plug 'janko-m/vim-test', { 'on':  ['TestFile', 'TestNearest', 'TestSuite', 'TestLast', 'TestVisit'] }
  let test#neovim#term_position = "tab"
    let test#strategy = "neovim"
    nmap <silent> <leader>tn :TestNearest<CR>
    nmap <silent> <leader>tf :TestFile<CR>
    nmap <silent> <leader>ts :TestSuite<CR>
    nmap <silent> <leader>tl :TestLast<CR>
    nmap <silent> <leader>tg :TestVisit<CR>
  Plug 'mattn/emmet-vim', { 'for': ['html', 'svelte', 'css', 'sass', 'scss'] }
  Plug 'huyvohcmc/atlas.vim'
  Plug 'dense-analysis/ale'
    let g:ale_ruby_rubocop_executable = 'bundle'
    let g:ale_completion_enabled = 0
    let g:ale_lint_on_text_changed = 'never'
call plug#end()

set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
set background=dark
" colorscheme off
" colorscheme monochrome
" colorscheme phoenix
" PhoenixRedEighties

colorscheme gruvbox
let g:airline_theme='tomorrow'
" let g:airline_theme='gruvbox'
" syntax off

" set showfulltag
" set complete=.                    " No wins, buffs, tags, include scanning
" set completeopt=menuone           " Show menu even for one item
" set completeopt+=noselect         " Do not select a match in the menu

set completeopt=menu,menuone,preview,noselect,noinsert

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
  command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
endif

if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

let g:elite_mode = 1
if get(g:, 'elite_mode')
  nnoremap <Up>    :resize +2<CR>
  nnoremap <Down>  :resize -2<CR>
  nnoremap <Left>  :vertical resize +2<CR>
  nnoremap <Right> :vertical resize -2<CR>
endif

map <leader>cs :call CreateSpec()<CR>

function! CreateSpec()
  " This function requires tpope/rails.vim
  let l:file_path = expand('%')
  let l:spec_path = substitute(l:file_path, '\vapp\/(.+)\.rb', '\1', '')
  silent execute 'Espec ' . l:spec_path . '!'
endfunction

map <leader>q :call BufClose()<CR>

function! BufClose()
  let bufcount = len(getbufinfo({'buflisted':1}))
  let text = bufcount ==# 1 ? execute('enew') : execute('bp')
  silent execute 'bw #'
endfunction

map <leader>d :call DeleteHiddenBuffers()<CR>

function! DeleteHiddenBuffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction

map <leader>cle :call CopyLinterError()<CR>

function! CopyLinterError()
  redir @+
  1message
  redir END
endfunction

map <leader>/ :call AddPry()<CR>

function! AddPry()
  execute "normal obinding.pry\<Esc>"
endfunction

augroup filetypes
  autocmd!
  autocmd BufNewFile,BufRead *.env.* setfiletype sh
  autocmd BufNewFile,BufRead *.rbi setfiletype ruby
  autocmd FileType gitcommit setlocal spell textwidth=72
  autocmd FileType svelte setlocal commentstring=<!--\ %s\ -->
augroup END

augroup ruby
  au!
  autocmd FileType ruby,eruby setlocal colorcolumn=100
augroup END

" Mappings {{{
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>V :source $MYVIMRC<CR>
nnoremap <leader>un :syntax sync fromstart<CR>:redraw!<CR>
nnoremap <leader>fef :normal! gg=G``<CR>

nnoremap <silent> // :nohlsearch<CR>

nnoremap _cs :setlocal filetype=css<CR>
nnoremap _co :setlocal filetype=coffee<CR>
nnoremap _ht :setlocal filetype=html<CR>
nnoremap _sl :setlocal filetype=slim<CR>
nnoremap _js :setlocal filetype=javascript<CR>
nnoremap _md :setlocal filetype=markdown<CR>
nnoremap _rb :setlocal filetype=ruby<CR>
nnoremap _sh :setlocal filetype=sh<CR>
nnoremap _vi :setlocal filetype=vim<CR>
nnoremap _an :setlocal filetype=yaml.ansible<CR>

nnoremap <leader>k <Plug>(ale_previous_wrap)
nnoremap <leader>j <Plug>(ale_next_wrap)
nmap <silent> <leader>ak <Plug>(ale_previous_wrap)
nmap <silent> <leader>aj <Plug>(ale_next_wrap)
nnoremap <C-k> <C-w><Up>
nnoremap <C-j> <C-w><Down>
nnoremap <C-l> <C-w><Right>
nnoremap <C-h> <C-w><Left>

nnoremap Q @q
vnoremap Q :norm @q<cr>

vnoremap <leader>ch :s/\v:(\w+)\=\>/\1: /g<CR>:nohlsearch<CR>0
nnoremap <leader>ch :.s/\v:(\w+)\=\>/\1: /g<CR>:nohlsearch<CR>0

if has('nvim')
  tmap <C-o> <C-\><C-n>
end

vnoremap // y/<C-R>"<CR>
" }}}

" vim:foldmethod=marker:
