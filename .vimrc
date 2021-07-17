set nocompatible
let g:ale_disable_lsp = 1

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
" Plugin 'marijnh/tern_for_vim'
" Plugin 'ervandew/supertab'
" Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'
" Plugin 'tpope/vim-endwise'
" Plugin 'Lokaltog/vim-easymotion'
Plugin 'davdai01/jcl.vim'
Plugin 'vim-scripts/hlasm.vim'
Plugin 'moll/vim-node'
" Plugin 'nvie/vim-flake8'
Plugin 'mxw/vim-jsx'
" Plugin 'airblade/vim-gitgutter'
Plugin 'justinj/vim-react-snippets'
" Plugin 'altercation/vim-colors-solarized.git'
Plugin 'davdai01/nerdtree-zos-plugin'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'lambdalisue/vim-gista'
" Plugin 'mattn/webapi-vim'
" Plugin 'mattn/gist-vim'
Plugin 'vimwiki/vimwiki'
Plugin 'leafgarland/typescript-vim'
Plugin 'diepm/vim-rest-console'
Plugin 'rking/ag.vim'
Plugin 'godlygeek/tabular'
Plugin 'flazz/vim-colorschemes'
Plugin 'xolox/vim-misc'
Plugin 'neoclide/coc.nvim'
" Plugin 'xolox/vim-easytags'
" tags are taking too much disk storage
" Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'mustache/vim-mustache-handlebars'
" Plugin 'sindresorhus/vim-xo'
" Plugin 'soramugi/auto-ctags.vim'
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


" set diffexpr=MyDiff()
" function! MyDiff()
"   let opt = '-a --binary '
"   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"   let arg1 = v:fname_in
"   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"   let arg2 = v:fname_new
"   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"   let arg3 = v:fname_out
"   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"   let eq = ''
"   if $VIMRUNTIME =~ ' '
"     if &sh =~ '\<cmd'
"       let cmd = '""' . $VIMRUNTIME . '\diff"'
"       let eq = '"'
"     else
"       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"     endif
"   else
"     let cmd = $VIMRUNTIME . '\diff'
"   endif
"   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
" endfunction
"
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
colo desert
" colo molokai

sy on
set sw=2
set ts=2

set tw=80
set encoding=utf-8
set hidden
set fileencoding=chinese
set fileencodings=ucs-bom,utf-8,chinese
set ambiwidth=double

set tabstop=2
set shiftwidth=2
set expandtab
" set lines=48
" set columns=135

if has("gui_running")
  set guioptions -=m
  set guioptions -=T
  " set guifont=Ubuntu\ Mono\ 12
  set guifont=Bitstream\ Vera\ Sans\ Mono:h16
endif

set noswapfile
set nobackup
set nowritebackup
set cmdheight=2
set shortmess+=c

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set updatetime=250

set redrawtime=10000

let mapleader = ","

nnoremap <leader><space> :noh<cr>

" let g:easytags_auto_highlight = 1
" let g:easytags_async = 1
" let g:easytags_by_filetype = '~/.vim/tags'
" let g:easytags_on_cursorhold = 1
" let g:easytags_auto_update = 1

let g:snipMate = { 'snippet_version' : 1 }

" flake8
" autocmd FileType python map <buffer> <C-k> :call flake8#Flake8()<CR>
" nnoremap <C-K> :call flake8#Flake8ShowError()<cr>
" autocmd BufWritePost *.py call flake8#Flake8()

map <C-d> :NERDTreeToggle<CR>
" map <C-o> :ConqueTermSplit bash<CR>
" map <C-i> :ConqueTermTab bash<CR>

map <C-n> :call ApplyMyCOBOLTag()<CR>

" imap <F9> <Plug>delimitMateS-Tab
imap <C-i> <Plug>delimitMateS-Tab

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

if &diff
  set cursorline
  map ] ]c
  map [ [c
endif

" let NERDTreeShowHidden=1

" vim-json
let g:vim_json_syntax_conceal = 0

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', 'package.json']
" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
" let g:ctrlp_user_command = 'find %s -type f'  " Linux
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'  " Linux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:user_emmet_leader_key='<C-e>'

nnoremap <c-u> :tabnext<cr>
vnoremap <c-u> :tabnext<cr>
inoremap <c-u> <Esc>:tabnext<cr>


com! FormatJSON %!python -m json.tool

set backspace=2
set backspace=indent,eol,start

" let g:SuperTabDefaultCompletionType = "context"

set statusline+=%#warningmsg#
set statusline+=%{fugitive#statusline()}
" set statusline+=%{gutentags#statusline()}
set statusline+=%*
let g:ag_working_path_mode="r"

" let g:gutentags_project_root = ['Makefile']

" ale.vim parms
let g:ale_fixers = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'javascript': ['eslint', 'prettier'],
      \  'ruby': ['rubocop'],
      \  'xml': ['xmllint'],
      \  'python': ['add_blank_lines_for_python_control_statements', 'autoimport', 'isort', 'yapf'],
      \ }

let g:ale_linters = {
      \  'javascript': ['eslint'],
      \  'xml': ['xmllint'],
      \ }
"     \  'java': ['checkstyle', 'javac'],
" let g:ale_sign_column_always = 1
" let g:ale_fix_on_save = 1
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0
map <C-y> <Plug>(ale_fix)
" map <C-m> <Plug>(ale_lint)

" AsyncRun parms
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
let g:asyncrun_open = 10
nnoremap <F10> :call asyncrun#quickfix_toggle(10)<cr>

" " EasyMotion parms
" let g:EasyMotion_do_mapping = 0 " Disable default mappings
"
" " Bi-directional find motion
" " Jump to anywhere you want with minimal keystrokes, with just one key
" " binding.
" " `s{char}{label}`
" nmap f <Plug>(easymotion-s)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
" nmap f <Plug>(easymotion-s2)
"
" "
" " Turn on case insensitive feature
" let g:EasyMotion_smartcase = 1

" let g:jsx_ext_required = 0 " Allow JSX in normal JS files
"
" let g:syntastic_javascript_checkers = ['eslint']

au BufEnter *.md,*.markdown setfiletype markdown
au BufEnter *.eslintrc setfiletype json
au BufEnter *.s setfiletype hlasm

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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <CR>
      \ pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
