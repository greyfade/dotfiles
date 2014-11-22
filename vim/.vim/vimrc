" Light backgrounds hurt my eyes.
set background=dark

" I speel gud, but I mkae tyops all the tiem.
set spell spelllang=en_us

" VI est mortuus. Vim vivat.
set nocompatible

" May as well...
set mouse=a

" Syntax coloring is a set of guideposts.
syntax on
filetype on
filetype plugin on
filetype indent on

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" 4-column tabs is the One True Way.
set ts=4 sw=4 sts=4

" ... But some people have a hard time being consistent.
set list listchars=tab:>-,trail:-
" I can't count.
set number

" Convenience makes my fingers happy.
map <F8> <ESC>:make<CR>
imap <F8> <ESC>:make<CR>a
" map <F12> <ESC>:cn<CR>
nmap <leader>g :silent !grunt hogan coffee less<CR><C-L>

" This seemed like a good idea, but it'll probably only encourage bad habits.
"command! -bang E e<bang>
"command! -bang Q q<bang>
"command! -bang W w<bang>
"command! -bang QA qa<bang>
"command! -bang Qa qa<bang>
"command! -bang Wa wa<bang>
"command! -bang WA wa<bang>
"command! -bang Wq wq<bang>
"command! -bang WQ wq<bang>

" A GVim thing.
set title
if has("gui_running")
	set go=aegirLt
endif

" I'm forgetful.
set history=1000

" This keeps me centered.
set scrolloff=3

" Helps me find things.
set ruler
set showmatch
set incsearch
set hlsearch

" This was before I found out about \c
set smartcase

" My, that bottom bar can get cluttered...
set shortmess=atI

" Everything else looks like crap.
colorscheme Tomorrow-Night-Bright

" I hate python.
autocmd filetype python set expandtab
autocmd filetype php set expandtab
autocmd filetype coffee set expandtab
autocmd filetype mustache set expandtab

" NERDtree crap
" autocmd vimenter * NERDTree
map <esc>t :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

augroup nemerle
	au!
	autocmd BufNewFile,BufReadPre *.n
		\ set fencs=ucs-bom,utf-8,iso-8859-2 fenc=utf-8
augroup END

augroup Binary
	au!
	au BufReadPre   *.bin let &bin=1
	au BufReadPost  *.bin if &bin | %!xxd
	au BufReadPost  *.bin set ft=xxd | endif
	au BufWritePre  *.bin if &bin | %!xxd -r
	au BufWritePre  *.bin endif
	au BufWritePost *.bin if &bin | %!xxd
	au BufWritePost *.bin set nomod | endif
augroup END

" cscope seems to work a little better than ctags, but Vim doesn't auto-load
" cscope files like it does ctags files.
if has("cscope")
	set cst
	set csto=0
	set nocsverb
	if filereadable("cscope.out")
		cs add cscope.out
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif

let ComniCpp_MayCompleteDot=1
let ComniCpp_MayCompleteArrow=1
let ComniCpp_MayCompleteScope=1

set completeopt=longest,menu

" Search paths for completions.
" Starting with local files and the default includes
set path+=.,/usr/include
" KDE-specific
set path+=/usr/include/KDE,/usr/include/qt4
" boost
set path+=/usr/include/boost

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:clang_library_path = '/usr/lib'
let g:clang_auto_select = 1
let g:clang_complete_auto = 1
let g:clang_complete_macros = 1

let g:proj_flags='imstS'

" I often forget to use sudoedit. Much to my chagrin.
cmap w!! %!sudo tee > /dev/null %

" Keeps my immune system in tip-top shape.
" Also, loads bundled scripts and plug-ins.
call pathogen#infect()

au BufNewFile,BufRead *.cpp set syntax=cpp11
au BufNewFile,BufRead *.hpp set syntax=cpp11
au BufNewFile,BufRead *.mustache set ft=html

let g:coffee_compiler = "/usr/bin/coffee"
let g:coffee_make_options = ""
au BufNewFile,BufRead *.coffee let b:coffee_litcoffee=""
