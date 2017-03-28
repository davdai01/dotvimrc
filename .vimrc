set nocompatible
"---Vundle Begin---
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
let path='~/.vim/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
Plugin 'tpope/vim-rails'
Plugin 'kien/ctrlp.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'rosenfeld/conque-term'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
" Plugin 'itchyny/lightline.vim'
" Plugin 'file:///home/david/Downloads/nerdtree5'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'marijnh/tern_for_vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-endwise'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'davdai01/jcl.vim'
Plugin 'moll/vim-node'
Plugin 'mxw/vim-jsx'
Plugin 'airblade/vim-gitgutter'
Plugin 'justinj/vim-react-snippets'
" Plugin 'altercation/vim-colors-solarized.git'
Plugin 'davdai01/nerdtree-zos-plugin'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'lambdalisue/vim-gista'
" Plugin 'mattn/webapi-vim'
" Plugin 'mattn/gist-vim'
Plugin 'vimwiki/vimwiki'
Plugin 'diepm/vim-rest-console'
Plugin 'rking/ag.vim'
Plugin 'godlygeek/tabular'
Plugin 'flazz/vim-colorschemes'
" Plugin 'vitalk/vim-simple-todo'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"---Vundle End---
" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin


set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

let g:myCOBOLTag = ''

function! TagLine(lnum, tag)
  let line = strpart(getline(a:lnum), 0, 72)
  let len = strlen(line)
  let filler = ''
  if len < 72
    let filler_len = 72 - len
    let filler = repeat(' ', filler_len)
  endif
  let newline = printf("%s%s%s", line, filler, a:tag)
  call setline('.', newline)

endfunction

function! CT(tag)
  " Usage:
  " :call CT("MYTAG")
  " then PF2 to repeat

  let g:myCOBOLTag = a:tag
  
  let slnum = line("v")
  let elnum = line('.')
  
  while slnum <= elnum
    call TagLine(slnum, a:tag)
    let slnum = slnum + 1
  endwhile

  " echo newline
endfunction

function! ApplyMyCOBOLTag()
  call CT(g:myCOBOLTag)
endfunction

"set go=
" colo industry
colo torte
sy on
set sw=2
set ts=2

set tw=80
set encoding=utf-8
set fileencoding=chinese
set fileencodings=ucs-bom,utf-8,chinese
set ambiwidth=double

set tabstop=2
set shiftwidth=2
set expandtab
set lines=48
set columns=135

if has("gui_running")
  set guioptions -=m
  set guioptions -=T
  set guifont=Ubuntu\ Mono\ 12
endif

set noswapfile
set nobackup

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set updatetime=250

let mapleader = ","

nnoremap <leader><space> :noh<cr>

map <C-d> :NERDTreeToggle<CR>
map <C-o> :ConqueTermSplit bash<CR>
map <C-i> :ConqueTermTab bash<CR>

map <F2> :call ApplyMyCOBOLTag()<CR>

imap <F9> <Plug>delimitMateS-Tab

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "*x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "*y

" paste from system clipboard
map <C-v> "*p
imap <C-v> <C-r>*


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
" let g:ctrlp_user_command = 'find %s -type f'  " Linux
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'  " Linux

let g:user_emmet_leader_key='<C-e>'

nnoremap <c-u> :tabnext<cr>
vnoremap <c-u> :tabnext<cr>
inoremap <c-u> <Esc>:tabnext<cr>

com! FormatJSON %!python -m json.tool

set backspace=2
set backspace=indent,eol,start

let g:SuperTabDefaultCompletionType = "context"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()} 
set statusline+=%*
let g:ag_working_path_mode="r"

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_lua_checkers = ["luac", "luacheck"]
let g:syntastic_lua_luacheck_args = "--no-unused-args"

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap f <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap f <Plug>(easymotion-s2)

"
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" let g:syntastic_javascript_checkers = ['eslint']

au BufEnter *.md,*.markdown setfiletype markdown

autocmd FileType markdown setlocal spell

let delimitMate_expand_space = 1
let delimitMate_expand_cr = 2
let delimitMate_jump_expansion = 1

" let g:vimwiki_list = [{'path': 'C:\Users\davdai01\SkyDrive\Workspace\vimwiki\', 'auto_export': 1,
"   \ 'path_html': 'C:\Users\davdai01\SkyDrive\Workspace\vimwiki\site_html\',
"   \ 'template_path': 'C:\Users\davdai01\SkyDrive\Workspace\vimwiki\templates\',
"   \ 'syntax': 'markdown', 'ext': '.vimwiki', 'template_ext': '.tpl',
"   \ 'custom_wiki2html': 'vimwiki_markdown'
"   \ }]
let g:vimwiki_hl_cb_checked = 1

let g:vimwiki_list = [{'path': '~/vimwiki/default', 'auto_export': 0,
  \ 'path_html': '~/vimwiki/default/html/'}, 
  \ {'path': '~/vimwiki/ctp120_test/', 'path_html': '~/vimwiki/ctp120_test/html/'}]

autocmd BufEnter *.wiki exe 'nnoremap <F5> :VimwikiAll2HTML<CR>:Vimwiki2HTMLBrowse<CR>:syn on<CR>'
