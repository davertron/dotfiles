set nocompatible               " be iMproved
filetype on			" turn on to avoid non-zero exit code in osx
filetype off                   " required!

set rtp+=~/.vim/Vundle.vim/
call vundle#rc()

" My Bundles here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-powerline'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'fjolnir/tranquil.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'elzr/vim-json'

" vim-scripts repos
Plugin 'L9'
Plugin 'rails.vim'
Plugin 'scratch'
Plugin 'ack.vim'
Plugin 'closetag.vim'
Plugin 'matchit.zip'
Plugin 'EasyMotion'
Plugin 'vim-coffee-script'
Plugin 'Gist.vim'
Plugin 'groovy.vim'
Plugin 'grails-vim'
Plugin 'taglist.vim'
Plugin 'The-NERD-Commenter'
Plugin 'ctrlp.vim'
Plugin 'Conque-Shell'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'camelcasemotion'
Plugin 'Tagbar'
Plugin 'neocomplcache'
Plugin 'jshint.vim'
Plugin 'Haml'
Plugin 'bufexplorer.zip'
Plugin 'rainbow_parentheses.vim'
Plugin 'vimux'
Plugin 'sudo.vim'
"Plugin 'Raimondi/delimitMate'
Plugin 'jade.vim'
Plugin 'vim-stylus'
Plugin 'YankRing.vim'
Plugin 'repeat.vim'
"Plugin 'jsruntime.vim'
"Plugin 'jsoncodecs.vim'
"Plugin 'sourcebeautify.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on     " required!
filetype indent on

autocmd!

set guifont=Inconsolata:h16
set history=500
set hidden
" Don't wrap lines
set wrap
" Don't wrap searches
set nowrapscan

" Make backspacing not be stupid
set backspace=indent,eol,start

" Share clipboard amongst mvim windows
" NOTE: Copying/pasting when using mvim is totally broken, and this seems to
" break it even worse, so leave the leader + y system copy below
"set clipboard=unnamed

" Try to get 256 colors...
set t_Co=256
set cursorline
colorscheme molokai

" Use bash for the shell in vim since the PATH gets hosed with zshrc
set shell=/bin/bash

" enable per-directory .vimrc files
set exrc
" disable unsafe commands in local .vimrc files
set secure

let mapleader = ","

let g:EasyMotion_leader_key = '<Leader>m'
let g:ctrlp_map = '<Leader>p'

" Enable autocomplete
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1

"Conque Send selected text to shell
let g:ConqueTerm_SendVisKey = '<Leader>sc'

" Don't try to manage the working dir just use what vim has when it was opened
let g:ctrlp_working_path_mode = 0
" Match filenames not full paths by default
let g:ctrlp_by_filename = 0

"Use relative paths in bufexplorer by default
let g:bufExplorerShowRelativePath=1

" Ignore some dirs...
set wildignore+=*target/*

" Replace netrw with secondary NERDTree
let NERDTreeHijackNetrw=1

syntax enable
"set noexpandtab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set statusline=%-f,%l,%L
"set tw=79
"set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ %{fugitive#statusline()}
set laststatus=2
set relativenumber
set hlsearch
set backupdir=~/.vim/.backups/,/tmp
set directory=~/.vim/.backups/,/tmp
set wildignore+=*.class,.git
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

" Enable mouse scrolling
" NOTE: This seems to fuck up visual selections...which is great
"set mouse=a

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ["jscs"]
let g:syntastic_json_checkers = ["jsonlint"]

nnoremap <leader>; ,
nnoremap <silent> <F10> :set paste!<CR>
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F9> :VSTreeExplore<CR>
nnoremap <leader>B :TagbarToggle<CR>
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
"map <Leader>. :CtrlPMRU<cr>
map <Leader>qn :cn<CR>
map <Leader>qp :cN<CR>
" Switch to last file
map <Leader>j :b#<CR>
"map <Leader>s :call SaveSession()<cr>
"map <Leader>L :call LoadSession()<cr>
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

" Update Macvim title
map <leader>ut :call PromptForUpdatedTitle()<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Bind make to F4; useful for working with jslint, etc.
nmap <F4> :w<CR>:make<CR>:cw<CR>

" Map copy to system clipboard to be a little more finger friendly
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Make Y behave like other capitals
"map Y y$

" Highlight word at cursor without changing position
nnoremap <leader>h *<C-O>
" Highlight word at cursor and then Ack it.
nnoremap <leader>H *<C-O>:AckFromSearch!<CR>

nnoremap <silent> <leader>cp :let @" = expand("%:p")

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Highlight bogus whitespace
"highlight ExtraWhitespace guibg=#333333
"match ExtraWhitespace /\s\+$/
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

"autocmd Filetype html,xml,xsl,gsp source ~/.vim/bundle/closetag.vim/plugin/closetag.vim
"autocmd Filetype gsp set filetype=html
" Delete fugitive buffers once they're hidden
autocmd BufReadPost fugitive://* set bufhidden=delete

" Set json files to be json
au! BufRead,BufNewFile *.json set filetype=json 

" Abbreviations
ab scriptcanvas   <script type="text/javascript" src="__UP_ddcGadgetHost__/gadget-content/libs/ddc/features/ddc.analytics.views.canvas/canvas.js"></script>
ab scriptutil   <script type="text/javascript" src="__UP_ddcGadgetHost__/gadget-content/libs/ddc/features/ddc.util/util.js"></script>
ab gmesg <g:message code="" />

"source /home/david/.vim/my_functions.vim

"Whenever the root of the NerdTree changes, set that as the CWD
let NERDTreeChDirMode=2

" Left align comments on toggle
let NERDDefaultAlign = 'left'

" Groovy syntax
au BufNewFile,BufRead *.groovy  setf groovy

" Xml linting/formatting
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Set up keybinding for mame project
function! VimuxKeybindings()
  let l:path = expand('%:p')
  if l:path =~ '.*node-webkit-test.*'
    nnoremap <leader>rr :call VimuxRunCommand("run")<CR>
  endif
endfunction

autocmd! BufReadPost,BufNewFile * call VimuxKeybindings()


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

function! InsertCurrentDate()
    r !date +\%m-\%d-\%Y
endfunction

function! UpdateTitleString(title)
    let &titlestring="%t - " . a:title
endfunction

function! PromptForUpdatedTitle()
    let s:newTitle = input('Enter Title:')
    if(strlen(s:newTitle) != 0)
        call UpdateTitleString(s:newTitle)
    endif
endfunction
