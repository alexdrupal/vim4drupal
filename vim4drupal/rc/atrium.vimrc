set nocompatible

set t_Co=256

"Show cursor position everytime
set ruler		

" Change cursor type (works in Konsole)
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7" 

" Set the desert color scheme
colorscheme desert

" Show commands in status bar
set showcmd		

" Remove wrapping
set nowrap

" Enable line numbers
set nu

" Set folding method
set foldmethod=indent

" Search during type
set incsearch

" Switch off search results highlight
set nohlsearch

set scrolljump=7
set scrolloff=7

" Disable bell
set novisualbell
set t_vb= 

" Enable Mouse
set mouse=a
set mousemodel=popup

" Set default encoding to UTF-8
set termencoding=utf-8

" Allows to edit several buffers at a time without having to save it before switching to another buffer
set hidden

" Hide panel. In GUI version we don't need it
set guioptions-=T

" Set commandline height
set ch=1

" Hide mouse when typing
set mousehide


" Enable autoindent
set autoindent

if has("autocmd")
    "Drupal *.module and *.install files.
    augroup module
        autocmd BufRead,BufNewFile *.module set filetype=php
        autocmd BufRead,BufNewFile *.install set filetype=php
        autocmd BufRead,BufNewFile *.inc set filetype=php
	autocmd BufRead,BufNewFile *.engine set filetype=php
	autocmd BufRead,BufNewFile *.profile set filetype=php
	autocmd BufRead,BufNewFile *.test set filetype=php
    augroup END
    augroup inf
        autocmd BufRead,BufNewFile *.info set filetype=txt
    augroup END
endif

iabbr Hook <C-R>=HookFunc()<CR>

" HookFunc(): Drupal helper function
function! HookFunc()
  let f = substitute(expand("%:t"), ".module", "", "g")
  return "function " . f . "_"
endfunction

" Enable syntax highlight
syntax on

" allow to use backspace instead of x
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Expand tabs as spaces
set expandtab

" Set tab width as 2 spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Set format for status line
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P 
set laststatus=2


" Enable smart indent
set smartindent

"
" Fix <Enter> for comment
set fo+=cr

" cd in project directory
cd /home/vim4drupal/www/atrium/

" Set session options
set sessionoptions=curdir,buffers,tabpages

"
"-------------------------
" Hotkeys
"-------------------------
"

" Space list pages when in normal mode
nmap <Space> <PageDown>

" CTRL-F for omni completion
imap <C-F> <C-X><C-O>

" C-c and C-v - Copy/Paste to the global Clipboard
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi

" Force shift-insert to work as in Xterm
map <S-Insert> <MiddleMouse>

" C-y - Delete current line
nmap <C-y> dd
imap <C-y> <esc>ddi

" C-d - Duplicate current line
imap <C-d> <esc>yypi

" F2 - quick save
nnoremap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

" F3 - show errors
nmap <F3> :copen<cr>
vmap <F3> <esc>:copen<cr>
imap <F3> <esc>:copen<cr>

" F5 - show buffers
nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc><esc>:BufExplorer<cr>

" F7 - NERDTree
nmap <silent> <F7> :NERDTreeToggle /home/vim4drupal/www/atrium<CR>
vmap <silent> <F7> <esc>:NERDTreeToggle /home/vim4drupal/www/atrium<CR>i
imap <silent> <F7> <esc>:NERDTreeToggle /home/vim4drupal/www/atrium<CR>i

" F8 - marks browser
map <F8> :MarksBrowser<cr>
vmap <F8> <esc>:MarksBrowser<cr>
imap <F8> <esc>:MarksBrowser<cr>

" F9 - make command
map <F9> :make<cr>
vmap <F9> <esc>:make<cr>i
imap <F9> <esc>:make<cr>i

" F10 - buffer delete
map <F10> :bd<cr>
vmap <F10> <esc>:bd<cr>
imap <F10> <esc>:bd<cr>

" F11 - show taglist window
map <F11> :TlistToggle<cr>
vmap <F11> <esc>:TlistToggle<cr>
imap <F11> <esc>:TlistToggle<cr>

" F12 - show netrw
map <F12> :Ex<cr>
vmap <F12> <esc>:Ex<cr>i
imap <F12> <esc>:Ex<cr>

" < & > - indents blocks
vmap < <gv
vmap > >gv

" Disable replace mode
imap >Ins> <Esc>i


" Add ] for [
imap [ []<LEFT>

" Same for {
imap {<CR> {<CR>}<Esc>O

" Same for (
imap (<CR> (<CR>)<Esc>O

" С-q - quite Vim 
map <C-Q> <Esc>:qa<cr>

" Tab autocomplete 
function InsertTabWrapper()
 let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction

imap <tab> <c-r>=InsertTabWrapper()<cr>

set complete=""

" Set complete from current buffer
set complete+=.
set complete+=k

" Set complete from other open buffers
set complete+=b

" Set complete from tags
set complete+=t

" Enable filetype plugin
filetype plugin on
au BufRead,BufNewFile *.phps set filetype=php
au BufRead,BufNewFile *.phtml set filetype=php
au FileType php set omnifunc=phpcomplete#CompletePHP

" SessionMgr settings
let g:SessionMgr_AutoManage = 0
let g:SessionMgr_DefaultName = "mysession"

" Taglist settings
let g:Tlist_Show_One_File = 1
let g:Tlist_Use_Right_Window = 1
let Tlist_Sort_Type = "name"
let Tlist_WinWidth = 50

" Complete options
set completeopt-=preview
set completeopt+=longest
set mps-=[:]

" Netrw settings
let g:netrw_browse_split = 3

" SnippetsEmu settings
let g:snippetsEmu_key = "<C-S>"
set tags+=/home/vim4drupal/.vim/vim4drupal/tags/atrium

let g:snippetsEmu_key = "<C+S>"

" Update tags file on BufWrite
function! UPDATE_TAGS()
  let _f_ = expand("%:p")
  let _cmd_ = '"ctags -a -f /home/vim4drupal/.vim/vim4drupal/tags/atrium --PHPkinds=+cf --totals --tag-relative " ' . '"' . _f_ . '"'
  let _resp = system(_cmd_)
  unlet _cmd_
  unlet _f_
  unlet _resp
endfunction
autocmd BufWrite *.php,*.inc,*.install,*.engine,*.profile,*.module,*.test call UPDATE_TAGS()

" phpDocumentor
" 
source ~/.vim/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR> 

