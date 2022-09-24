set nocompatible
set number
set tabstop=4
set shiftwidth=4
set noexpandtab
set textwidth=0

"ファイルタイプ別設定
augroup fileTypeIndent
	autocmd!
	" html/javascript
	autocmd BufNewFile,BufRead *.html setlocal expandtab tabstop=2 shiftwidth=2
	autocmd BufNewFile,BufRead *.css setlocal expandtab tabstop=2 shiftwidth=2
	autocmd BufNewFile,BufRead *.scss setlocal expandtab tabstop=2 shiftwidth=2
	autocmd BufNewFile,BufRead *.js setlocal expandtab tabstop=2 shiftwidth=2
augroup END

"音/フラッシュオフ
set visualbell t_vb=

"バックアップファイル/スワップファイル
set backupdir=~/tmp
set directory=~/tmp

"leader
"map \ <Leader>

"NeoBundle用設定
filetype off
if has('vim_starting')
	if &compatible
		set nocompatible
	endif
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build': {
	\ 'windows': 'tools\\update-dll-mingw',
	\ 'cygwin': 'make -f make_cygwin.mak',
	\ 'mac': 'make -f make_mac.mak',
	\ 'linux': 'make',
	\ 'unix': 'gmake',
\ },
\}
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'scrooloose/nerdtree'

" Colorscheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'tomasr/molokai'

call neobundle#end()

"不可視文字の表示
set list
set listchars=tab:>-,trail:_,extends:>,precedes:<

"カラースキーム
set t_Co=256
if (has('win32') || has('win64')) && !has('gui_running')
	colorscheme wombat
else
	colorscheme jellybeans
endif

"全角スペースハイライト
augroup highlightIdegraphicSpace
autocmd!
autocmd Colorscheme * highlight IdegraphicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
autocmd VimEnter,WinEnter * match IdegraphicSpace /　/
augroup END

filetype plugin indent on
filetype indent on
syntax on

NeoBundleCheck

"***
"***quickun
"***
nnoremap <leader>r :QuickRun<CR>
let g:quickrun_config = {}
if has('mac')
	let g:quickrun_config['objc'] = {
		\'command': 'cc',
		\'exec': ['%c %s -o %s:p:r -framework Foundation', '%s:p:r %a', 'rm -f %s:p:r'],
		\'tempfile': '{tempname()}.m'
	\}
	let g:quickrun_config['cs'] = {
		\'command': 'mcs',
		\'exec': ['%c %o %s:p > /dev/null', 'mono %s:p:r.exe', 'rm %s:p:r.exe'],
		\'cmdopt': '-warn:4',
		\'quickfix/errorformat': '%f\\(%l\\,%c\\):\ error\ CS%n:\ %m',
	\}
	let g:quickrun_config['cpp'] = {
		\'command': 'g++',
		\'cmdopt': '-std=c++11'
	\}
endif

"***
"***Shougo/neocomplcache
"***
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'vimshell' : /home/masakazu.'/.vimshell_hist',
"    \ 'scheme' : /home/masakazu.'/.gosh_completions'
"        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplcache#smart_close_popup() . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

