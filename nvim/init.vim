call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Examples
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'vim-scripts/YankRing.vim'
Plug 'flazz/vim-colorschemes'
Plug 'easymotion/vim-easymotion'
Plug 'jpalardy/vim-slime'
Plug 'preservim/nerdtree'
Plug 'github/copilot.vim'
Plug 'catppuccin/nvim'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

colorscheme molokai
set guifont=Inconsolata:h16
set relativenumber
set incsearch
set hlsearch
set showmatch

let mapleader = ","

" Use tmux for slime
let g:slime_target = "tmux"

" NOTE: These don't work since we use <leader><leader> to open Nerdtree...
" Easymotion
" Use <leader><leader>w for word motions
" Use <leader><leader>s for single character search
" Use <leader><leader>f for single character search forward
"map <Leader><Plug>(easymotion-prefix)

" Normal mode mapping to toggle nerdtree
nnoremap <leader>, :NERDTreeToggle<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
" Map ctrl-p to open Telescope buffers
nnoremap <C-p> <cmd>Telescope buffers<cr>
nnoremap <leader>f 356C-F8C6h <cmd>Telescope help_tags<cr>

" Normal mode mapping to go to the next line
nnoremap j gj
nnoremap k gk

" Normal mode mapping to switch to the last buffer
nnoremap <leader>j :b#<CR>

" Window movement mapping
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Mapping to yank to system clipboard
nnoremap <leader>y "+y

" Mapping to use ctrl-c to close the current buffer
nnoremap <C-c> :bd<CR>

" Shut off search highlighting
nnoremap <leader><space> :noh<cr>
