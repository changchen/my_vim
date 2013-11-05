"GUI settings
set guioptions=mrbe
" General settings
set nocompatible
set encoding=utf-8
set ruler
set number
set nohlsearch
set ignorecase
set autoindent
set cindent
set cinoptions=l1 
set tabstop=4
set shiftwidth=4
set showmatch
set incsearch
set nowrap
set linebreak
set guifont=Consolas:h10:cANSI
set guifontwide=NSimsun:h11
set updatetime=1000
set sidescroll=1
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
"set statusline=%F%m%r%h%w\ (%{&ff}){%Y}[%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ [%l\/%L,\ %c%V]\ %P
set guitablabel=[%M%N]%t
color Koehler
let g:html_dynamic_folds = 1
filetype plugin on
filetype plugin indent on
syntax on
autocmd FileType python setlocal et sta sw=4 sts=4
"解决console输出乱码
language messages zh_cn.utf-8
"解决中文菜单乱h码
"set langmenu=zh_CN.utf-8*/
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

map <F2> :cs find 
map <S-F2> :cs find  <C-R>=expand("<cword>")<CR><C-Left><Left>
"map <F3> :tab cs find 
"map <F3> :vimgrep /<C-R>=expand("<cword>")<CR>/ %<CR>:copen<CR>
map <F3> :call Vimgrep_CurrentFile()<CR>
map <F4> :set wrap!<CR>
imap <C-F5> <C-R>=strftime("%C")<CR>
nnoremap <F11> :NERDTreeToggle<CR>
nnoremap <F12> :TlistToggle<CR>

" pathogen.vim setting
" execute pathogen#infect()

" taglist setting
set tags=tags;
set autochdir
let Tlist_Ctags_Cmd="ctags"

" NERDTree Setting
let NERDTreeWinPos="right"

" Cscope Setting
" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag
	
	" set cscopequickfix=s-,c-,d-,i-,t-,e-

	set cspc=1

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  
endif

" Only do this part when compiled with support for autocommands
"" if has("autocmd")
" In text files, always limit the width of text to 78 characters
"" autocmd BufRead *.txt set tw=78
" When editing a file, always jump to the last cursor position
"" autocmd BufReadPost *
"" \ if line("'\"") > 0 && line ("'\"") <= line("$") |
"" \ 	exe "normal g'\"" |
"" \ endif
"" endif


" CCTREE Setting
let g:CCTreeOrientation="rightbelow"

" PreviewWord()
" map <F9> :au! CursorHold *.[ch] nested exe "silent! ptag " . expand("<cword>")<CR>
" map <S-F9> :au! CursorHold<CR>:pclose<CR>


" // The switch of the Source Explorer
nmap <F9> :SrcExplToggle<CR>

" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 8

" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100

" // Set "Enter" key to jump into the exact definition context
" let g:SrcExpl_jumpKey = "<ENTER>"

" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"

" // In order to Avoid conflicts, the Source Explorer should know what plugins
" // are using buffers. And you need add their bufname into the list below
" // according to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
		\ "NERD_tree_1",
        \ "Source_Explorer"
    \ ]

" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1

" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" //  create/update a tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

" // Set "<F10>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F10>" 

" map <F3> :execute Vimgrep_CurrentFile()<CR>
let s:Vimgrep_CurrentFile_Running = 0
function! Vimgrep_CurrentFile()
	if s:Vimgrep_CurrentFile_Running == 0
		let l:WordUnderCursor = expand("<cword>")
		execute "vimgrep" . '/' . l:WordUnderCursor . '/' . '%'
		copen
		let s:Vimgrep_CurrentFile_Running = 1
	else
		cclose
		let s:Vimgrep_CurrentFile_Running = 0
	endif
endfunction
