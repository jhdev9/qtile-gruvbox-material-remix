" Custom configurations NVIM
if &compatible
  set nocompatible
endif

set backspace=indent,eol,start
set ruler
set suffixes+=.aux,.bbl,.blg,.brf,.cb,.dvi,.idx,.ilg,.ind,.inx,.jpg,.log,.out,.png,.toc
set suffixes-=.h
set suffixes-=.obj
set number
set relativenumber
set mouse=a
set numberwidth=1
set clipboard=unnamedplus
set showcmd
set ruler
set cursorline
set showmatch
set sw=2
set relativenumber
set autoindent
set expandtab
set noshowmode
set hlsearch
set ignorecase
set smartcase

set updatetime=100

" Move temporary files to a secure location to protect against CVE-2017-1000382
if exists('$XDG_CACHE_HOME')
  let &g:directory=$XDG_CACHE_HOME
else
  let &g:directory=$HOME . '/.cache'
endif
let &g:undodir=&g:directory . '/vim/undo//'
let &g:backupdir=&g:directory . '/vim/backup//'
let &g:directory.='/vim/swap//'
" Create directories if they doesn't exist
if ! isdirectory(expand(&g:directory))
  silent! call mkdir(expand(&g:directory), 'p', 0700)
endif
if ! isdirectory(expand(&g:backupdir))
  silent! call mkdir(expand(&g:backupdir), 'p', 0700)
endif
if ! isdirectory(expand(&g:undodir))
  silent! call mkdir(expand(&g:undodir), 'p', 0700)
endif

" Make shift-insert work like in Xterm
if has('gui_running')
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif


" Plug
call plug#begin()
 "Syntax
Plug 'sheerun/vim-polyglot'
Plug 'uiiaoo/java-syntax.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'

"Find
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf.vim'

"Themes
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'
Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }
Plug 'arzg/vim-colors-xcode'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'navarasu/onedark.nvim'
Plug 'sainnhe/gruvbox-material'

"Status bar
Plug 'maximbaz/lightline-ale'
Plug 'hallzy/lightline-onedark'
Plug 'itchyny/lightline.vim'

"Typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'dnlhc/glance.nvim'

"Temux
Plug 'christoomey/vim-tmux-navigator'

"Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"TabNine
Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }

"Editor
Plug 'mhinz/vim-signify', { 'tag': 'legacy' }
Plug 'airblade/vim-gitgutter'
Plug 'OmniSharp/omnisharp-vim'
Plug 'nvim-java/nvim-java-dap'

call plug#end()

let g:lightline = {
     \ 'colorscheme': 'one',
      \ }

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.zul'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.zul'
let g:closetag_filetypes = 'html,xhtml,phtml,zul'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,zul'
let g:closetag_emptyTags_caseSensitive = 2
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact':'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:surround_45 = "([{'\""

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
noremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


let g:onedark_config = {
    \ 'style': 'warmer',
\}

" Signify configuration
let g:signify_vcs_list = ['git', 'hg']

" Gruvbox Material configuration
if has('termguicolors')
  set termguicolors
endif

" Set background theme (dark or light)
set background=dark
" Uncomment the line below if you prefer a light background
" set background=light

let g:gruvbox_material_transparent_background = 2
" Set Gruvbox Material background contrast
" This option should be placed before `colorscheme gruvbox-material`
" Available values: 'hard', 'medium' (default), 'soft'
let g:gruvbox_material_background = 'medium'

" Enable better performance for Gruvbox Material
let g:gruvbox_material_better_performance = 1

" Set Gruvbox Material foreground style
let g:gruvbox_material_foreground = 'material'


" Configure lightline with Gruvbox Material colorscheme
let g:lightline = {'colorscheme': 'gruvbox_material'}

" Set airline theme to Gruvbox Material
let g:airline_theme = 'gruvbox_material'

" Apply the Gruvbox Material colorscheme
colorscheme gruvbox

colorscheme gruvbox-material


let mapleader = " "

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>nn :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-e> :NERDTreeFind<CR>


nmap <C-f>d <Plug>(easymotion-s2)
nmap <C-f>f :Files<CR>
nmap <C-b> :Buffers<CR>
nmap <C-f> :Lines<CR>
nmap <C-g>c :help vim-go<CR>

