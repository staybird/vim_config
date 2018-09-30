"""""""""""""""""""""""""""""""""""
"" vim config
"""""""""""""""""""""""""""""""""""
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936,euc-kr
set nobackup
set nowritebackup
set noswapfile
set bsdir=buffer
" set autochdir
set nocursorline
set shiftwidth=4
set expandtab
set softtabstop=4 
set tabstop=4
set noerrorbells
set backspace=indent,eol,start
set smarttab
set wrap
set hidden
set magic
set tw=180
set shiftround
set scrolloff=5

set guifont=Consolas:h12
"set source $VIMRUNTIME/delmenu.vim 
"set source $VIMRUNTIME/menu.vim

language messages zh_CN.utf-8

set nocompatible

"""""""""""""""""""""""""""""""""""
"" vundle config
"""""""""""""""""""""""""""""""""""
" filetype off                  " required!

" ==================================== syntasitc configured ==============================================
" set statusline must before set vundle's rtp
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
map <F2> :SyntasticToggleMode<CR>

" ==================================== syntasitc configured end ==========================================
set runtimepath^=e:/Tool/vim/vimfiles/bundle/vim-erlang-tags
"set runtimepath^=e:/Tool/vim/vimfiles/bundle/vim-erlang-compiler
set rtp+=$VIM/vimfiles/bundle/Vundle.vim

call vundle#begin('$VIM/vimfiles/bundle/')

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" My bundles here:
Plugin 'tpope/vim-pathogen'
Plugin 'easymotion/vim-easymotion'
Plugin 'https://github.com/vim-scripts/L9.git'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-scripts/bash-support.vim'
Plugin 'yegappan/grep'
Plugin 'vim-scripts/taglist.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-erlang/vim-erlang-tags'
Plugin 'https://github.com/aperezdc/vim-template.git'
"Plugin 'youthy/vimerl-complete'
Plugin 'https://github.com/eikenb/acp.git'
Plugin 'vim-scripts/Syntastic'

call vundle#end()


"Bundle 'jimenezrick/vimerl'
"Bundle 'vim-scripts/cmd.vim'
"Bundle 'majutsushi/tagbar'
"Bundle 'fholgado/minibufexpl.vim'
"Bundle 'b/findstr.vim'
"Bundle 'vim-erlang/vim-erlang-compiler'

"""""""""""""""""""""""""""""""""""
"" status bar config
"""""""""""""""""""""""""""""""""""
set laststatus=2
set statusline=%f\ \%h%m%r%r%=%-35(%l,%c\ [0x%B]\ (%L\ lines)\ %Y%)\ %P

colo torte
syntax on
let g:erlang_highlight_bifs = 0
let g:erlang_highlight_special_atoms = 1
filetype on
filetype plugin on
filetype indent on
set nu
""c/c++ autoindent
set autoindent
set cindent			
"" high light search
set hlsearch 
set ignorecase
set incsearch
set ci
set noet
set sw=4
let g:BufClose_AltBuffer = 'bNext'
map <leader>d :BufClose<cr>

" set filetype=python
" au BufNewFile,bufRead *.py,*.pyw setf python

hi Search guibg=#ff6600 guifg=#ffffff
hi IncSearch guibg=#ff6600 guifg=#ffffff
hi cursorline guibg=#222222
hi cursorcolumn guibg=#222222
function! ToggleCursorLine()
    if !exists("g:CursorLineStatu")
        let g:CursorLineStatu = 0
    endif
    if g:CursorLineStatu == 1
        set nocursorcolumn
        set nocursorline
        let g:CursorLineStatu = 0
    else
        set cursorcolumn
        set cursorline
        let g:CursorLineStatu = 1
    endif
endfunction

"Alt+m
map <m-m> :call ToggleCursorLine()<cr> 

" 启动的时候不显示援助索马里儿童的提示 
set shortmess=atI 

let mapleader = ";"
let g:mapleader = ";"

function! MyOpenProtect()
	let C = getchar()
	let C2 = nr2char(C)
	echo C2
	let C3 = getcwd()
	echo C3
	if C2 == 'm'
		:cd h:\m19\server\trunk 
		:NERDTree H:\\m19\server\trunk
		:set tag^=h:\m19\server\trunk\tags
	endif
	if C2 == 's'
		:cd h:\mochiweb\
		:NERDTree H:\\mochiweb
		:set tag^=h:\mochiweb\tags
	endif
	if C2 == 'b'
		:cd h:\m19\server\branch\VersionB\
		:NERDTree H:\\m19\server\branch\VersionB
		:set tag^=h:\m19\server\trunk\tags
	endif
endfunction
map <F4> :call MyOpenProtect()<cr>

" vim-erlang-tags
function! FindHrl(hrl)
	let File = join([a:hrl,'hrl'], '.')
	echo File
	try 
		execute 'tj 'File''
	catch /.*/
		echo v:exception
		:set tag+=h:\\m19\server\trunk\tags
	endtry
endfunction

nnoremap <leader>h	:call FindHrl(expand('<cword>'))<cr>

" ==================================== easymotion configured =============================================
" <Leader>f{char} to move to {char}
map <leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" ==================================== easymotion configured end =========================================


" Findstr configured
" https://github.com/WhatsDJGPP/findstr.vim.git
let Findstr_Default_Filelist = '\\src\\*.erl script\\*.config proto\\*.proto'
let Findstr_OpenQuickfixWindow = 0
let Findstr_Exclude_Dir = '.svn\\ .idea\\ as3\\ doc\\ ebin\\ log\\ script\\ tags'
nmap <leader>ee :e H:\Tool\Vim\_vimrc<cr>
nmap <leader>rr :source H:\Tool\vim\_vimrc<cr>

nmap <F5> :vimgrep <cword> **/*.erl<cr>

map <leader>tn :tabnew<cr>
map <leader>tc :tabc<cr>
map <c-tab> :tabnext<cr>
map <c-s-tab> :tabNext<cr>
map <m-1> 1gt
map <m-2> 2gt
map <m-3> 3gt
map <m-4> 4gt
map <m-5> 5gt
map <m-6> 6gt
map <m-7> 7gt
map <m-8> 8gt
map <m-9> 9gt

map <leader>vs :vsplit<cr>
map <leader>ss :split<cr>

" 使用undo和redo时无需切换模式
map  <c-u> :undo<cr>
map  <c-r> :redo<cr>
map! <c-/> <c-o>:undo<cr>
map! <m-u> <c-o>:undo<cr>
map! <c-u> <c-o>:undo<cr>
map! <c-r> <c-o>:redo<cr>

"在编辑模式下使用缩进功能
map! <m-,> <c-o>V<
map! <m-.> <c-o>V>

"在编辑模式下移动光标
map! <m-h> <c-o>h
map! <m-j> <c-o>j
map! <m-k> <c-o>k
map! <m-l> <c-o>l

"在编辑模式下使用复制粘贴功能
map! <m-o> <c-o>o
map! <m-O> <c-o>O
map! <m-y> <c-o>yy
map! <m-p> <c-o>p
map! <m-P> <c-o>P

nmap <leader>cc :cc<cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>co :copen<cr>
nmap <leader>cw :cw<cr>
nmap <leader>cr :cr<cr>
nmap <leader>cl :cl<cr>

" minibufexpl
map <Leader>mbo :MBEOpen<cr>
map <Leader>mbc :MBEClose<cr>
map <Leader>mbt :MBEToggle<cr>

set clipboard+=unnamed
autocmd! bufwritepost _vimrc :source $VIM\_vimrc

if has("gui_running") 
    " set guioptions-=m " 隐藏菜单栏 
    " set guioptions-=T " 隐藏工具栏 
    " set guioptions-=L " 隐藏左侧滚动条 
    " set guioptions-=r " 隐藏右侧滚动条 
    " set guioptions-=b " 隐藏底部滚动条 
    set guioptions=
endif 

let g:syntastic_enable_signs=1
" let g:syntastic_auto_loc_list=1
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
function! ToggleErrors()
    if !exists("g:errors_is_show")
        let g:errors_is_show = 0
    endif
    if g:errors_is_show
        let g:errors_is_show = 0
        lclose
    else
        let g:errors_is_show = 1
        " Errors 需要Syntastic插件支持
        Errors
    endif
endfunction

"map! <m-e> <c-o>:call ToggleErrors()<cr>
"map <m-e> :call ToggleErrors()<cr>

" 括号补全 "
"inoremap ( ()<left>
"inoremap { {}<left>
"inoremap [ []<left>
"inoremap " ""<left>
"inoremap ' ''<left> 
inoremap << <<>><left><left>
inoremap <<< <<<

if has('gui_running') && has("win32")
    map <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif

map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<cr>

"Session相关
set sessionoptions+=resize
map <F3> :mksession! ~/worksess.vim<cr>
map <leader>load :source ~/worksess.vim<cr>

let g:BASH_LineEndCommColDefault=45
let g:miniBufExplorerAutoStart = 0


"""""""""""""""""""""""""""""""""""
"" ctags & Tlist for erlang
"" to generate ctags, execute : ctags --file-scope=no -R --languages=erlang .
"" jump to function : ctrl + ]
"" jump back : ctrl + t
"" open|close function list : <F8>
"" next find tag : :tnext
"" select finded tags : :tselect /^tagname$
"""""""""""""""""""""""""""""""""""
let Tlist_Use_Right_Window=1
let Tlist_Enable_Fold_Column=0
let Tlist_Show_One_File=1 " especially with this one
let Tlist_Compact_Format=1
let Tlist_Ctags_Cmd='C:\Windows\ctags.exe'
set updatetime=1000
nmap ,t :!(cd %:p:h;ctags *)& " Maps the updates of tags to key ,t.
set tags=tags " The ';' at the end will cause the ctags plugin to search for current dir and above dirs until it find a tag file.
set tags+=C:\erl5.9.2\lib\tags

" Add the following below if you want to generate ctags upon saving a file
" Auto-generate ctags upon making changes to a file
" autocmd BufWritePost *.erl :silent !(cd %:p:h;ctags *)&

" If you want to auto compile (erlc) upon saving a file, then add that one as well
" Run erlc on the file being saved
" autocmd BufWritePost *.erl :!erlc <afile>
nnoremap <silent> <F8> :TlistToggle<CR>

nmap <leader>cyg :ConqueTermSplit Cygwin.bat<cr>
nmap <leader>erl :ConqueTermSplit erl<cr>
nmap <leader>sh :ConqueTermSplit sh<cr>
nmap <leader>py :ConqueTermSplit python<cr>
nmap <leader>cmd :ConqueTermSplit cmd<cr>
nmap <leader>mk :ConqueTermSplit make<cr>
nmap <leader>st :ConqueTermSplit start.sh<cr>

" Excluding version control directories
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*  " Windows ('noshellslash')

let g:ConqueTerm_ReadUnfocused=1

iabbrev fasle false
iabbrev flase false
iabbrev ture true


nmap <leader>d :source ~/test.vim<cr>
nnoremap <leader>t dddd


