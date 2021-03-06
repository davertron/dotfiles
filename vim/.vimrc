set nocompatible               " be iMproved
filetype on			" turn on to avoid non-zero exit code in osx
filetype off                   " required!

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-surround'
Bundle 'chrismetcalf/vim-yankring'
" vim-scripts repos
Bundle 'L9'
Bundle 'rails.vim'
Bundle 'scratch'
Bundle 'ack.vim'
Bundle 'bufexplorer.zip'
Bundle 'closetag.vim'
Bundle 'matchit.zip'
Bundle 'EasyMotion'
Bundle 'groovy.vim'
Bundle 'grails-vim'
Bundle 'vim-coffee-script'
Bundle 'Gist.vim'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!

autocmd!

set guifont=Inconsolata:h15
set history=500
set hidden

" Try to get 256 colors...
"set t_Co=256
colorscheme molokai

let g:EasyMotion_leader_key = '<Leader>m'

syntax enable
set noexpandtab
"set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set statusline=%-f,%l,%L
"set tw=79
"set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ %{fugitive#statusline()}
set laststatus=2
"set number
set hlsearch
set backupdir=~/.vim/.backups/,/tmp
set directory=~/.vim/.backups/,/tmp
set wildignore+=*.class,.git
set formatoptions=tcq
" Amount of lines to keep between the top/bottom of the window and the cursor
set scrolloff=1
set wildmenu
set wildmode=list:longest
set ignorecase
set smartcase
" Default to global search/replace on line instead of first occurrence
set gdefault
" Show searches as you type
set incsearch
set showmatch

let mapleader = ","

nnoremap <silent> <F12> :set paste!<CR>
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F9> :VSTreeExplore<CR>
" Use normal regexes, not VIM's weird ones
nnoremap / /\v
vnoremap / /\v
" Shut off search highlighting
nnoremap <leader><space> :noh<cr>
" Update command t
nnoremap <leader>T :CommandTFlush<cr>
" Go down to the next line, not the next visible line
nnoremap j gj
nnoremap k gk
" Get rid of help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

map <Leader>, :NERDTreeToggle<cr>
map <Leader>. ,be
map <Leader>qn :cn<CR>
map <Leader>qp :cN<CR>
" Switch to last file
map <Leader>j :b#<CR>
map <Leader>s :call SaveSession()<cr>
map <Leader>l :call LoadSession()<cr>
" Update jslint
map <Leader>js :JSLintUpdate<CR>
" Email selected text
map <Leader>e :call EmailText()<cr>
" Remap escape to a more finger-friendly key
imap kj <Esc>
" Clean up all whitespace at the end of lines for the whole file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>a :Ack
" Fold tag, handy for html folds
nnoremap <leader>ft Vatzf
" Reselect pasted text for manipulation
nnoremap <leader>v V`]
" Remap window movement keys to be more finger friendly
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-c> <C-w><C-c>

nnoremap <leader>bb :call OpenNerdtreeBookmark()<CR>
nnoremap <F5> :GundoToggle<CR>
nnoremap <leader>ss :ScratchOpen<CR>
nnoremap <leader>svs :Sscratch<CR>
nnoremap <Leader>A :Ack '<C-r><C-w>'<cr>

map <leader>jt  <Esc>:%!python -mjson.tool<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Bind make to F4; useful for working with jslint, etc.
nmap <F4> :w<CR>:make<CR>:cw<CR>

" Map copy to system clipboard to be a little more finger friendly
nmap <leader>y "+y
vmap <leader>y "+y

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Highlight bogus whitespace
highlight ExtraWhitespace ctermbg=DarkRed guibg=DarkRed
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

autocmd Filetype html,xml,xsl,gsp source ~/.vim/bundle/closetag.vim/plugin/closetag.vim
autocmd Filetype gsp set filetype=html

" Abbreviations
ab scriptcanvas   <script type="text/javascript" src="__UP_ddcGadgetHost__/gadget-content/libs/ddc/features/ddc.analytics.views.canvas/canvas.js"></script>
ab scriptutil   <script type="text/javascript" src="__UP_ddcGadgetHost__/gadget-content/libs/ddc/features/ddc.util/util.js"></script>

"source /home/david/.vim/my_functions.vim

"Whenever the root of the NerdTree changes, set that as the CWD
let NERDTreeChDirMode=2

" Groovy syntax
au BufNewFile,BufRead *.groovy  setf groovy

if did_filetype()
	finish
endif
if getline(1) =~ '^#!.*[/\\]groovy\>'
	setf groovy
endif

function! OpenNerdtreeBookmark()
  let s:bookmark = input('Bookmark name: ')
  if(strlen(s:bookmark) != 0)
    exe "NERDTreeFromBookmark " . s:bookmark
  else
    echo "Boorkmark open cancelled."
  endif
endfunction

function! SaveSession()
  let s:session_name = input('Name your session: ')
  if(strlen(s:session_name) != 0)
    exe "mks! ~/.vim/sessions/" . s:session_name . ".vim"
    echo "Saved session to ~/.vim/sessions/" . s:session_name . ".vim"
  else
    echo "Did not save session, please pass at least one character for the session name."
  endif
endfunction

function! LoadSession()
  let s:session_name = input('Which session would you like to load?: ')
  exe "so ~/.vim/sessions/" . s:session_name . ".vim"
  "echo "Loaded ~/.vim/sessions/" . s:session_name . ".vim"
endfunction

function! SaveSessionAndQuit()
  " Make sure they want to quit
  call SaveSession()
  " exit
endfunction

function! EmailText() range
  let s:text = ''
  for linenum in range(a:firstline, a:lastline)
    let s:text .= getline(linenum)
  endfor

  let s:subject = input('E-mail subject: ')
  let s:email = input('E-mail address: ')

  call system('mail -s ' . s:subject . ' ' . s:email, s:text)
endfunction

