" TODO: scratch?

" Leader key settings
let mapleader = " "
set timeoutlen=1000

" Search settings
nmap <return> :noh<CR>
set ignorecase
set smartcase

" No line wrap
set nowrap

" Show line numbers
set number
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Set terminal title
set title
auto BufEnter * let &titlestring = fnamemodify(getcwd(), ":t") . " (nvim)"

" Enable filetype plugin
:filetype on
filetype plugin on

" Show indentation, trailing spaces
set listchars=tab:→\ ,trail:·,nbsp:·
set list

" Reducing updatetime
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Set yank default target to system clipboard
set clipboard+=unnamedplus

" Automatically create folder for file
autocmd BufWritePre * :Mkdir!

" Set default tabs
set tabstop=8
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Custom tabline
execute 'source ' . expand("~/.dotfiles/vim/tabline.vim")

" Plugins
call plug#begin(stdpath('data') . 'plugged')

" Git
Plug 'tpope/vim-fugitive'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.3, 'yoffset': 1.0 } }

" Automatic tab detection
Plug 'tpope/vim-sleuth'
let g:sleuth_automatic = 1
Plug 'editorconfig/editorconfig-vim'

" File operations
Plug 'tpope/vim-eunuch'

" Text operations
Plug 'tpope/vim-surround'

" Easymotion
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-tsserver', 'coc-clangd']

" Airline (Tabline and Statusline)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1

" Theme
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" Set Theme
set termguicolors
syntax enable
colorscheme dracula

" Keybindings

" - Find project
execute 'source ' . expand("~/.dotfiles/vim/project-switcher.vim")
nmap <leader>pp :call SwitchProject()<CR>

" - Find files in current project
nmap <leader><leader> :Files<CR>
nmap <leader>sp :Ag<CR>

" - Open scratchpad
nmap <leader>x :split <bar> :wincmd j <bar> :e ~/.scratch<CR>

" - Easymotion
nmap <Leader>ss <Plug>(easymotion-overwin-f2)
nmap <Leader>sw <Plug>(easymotion-overwin-w)

" - Terminal
augroup neovim_terminal
  autocmd!
  " Enter Terminal-mode (insert) automatically
  autocmd TermOpen * startinsert
  " Disables number lines on terminal buffers
  autocmd TermOpen * :set nonumber norelativenumber

  " allows you to use Ctrl-c on terminal window
  autocmd TermOpen * tnoremap <buffer> <C-c> i<C-c>
  " Escape to unfocus terminal
  autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
  autocmd FileType fzf tunmap <buffer> <Esc>
  " C-v Esc to send Escape to terminal (verbatim escape)
  autocmd TermOpen * tnoremap <buffer> <C-v><Esc> <Esc>
augroup END

nmap <Leader>tv :vsplit \| :wincmd l \| :terminal<CR>
nmap <Leader>th :split \| :wincmd j \| :terminal<CR>
nmap <Leader>t. :terminal<CR>

" - Tabs
nmap <leader><tab>n :$tabnew<CR>
nmap <leader><tab>d :tabclose<CR>
for i in range(1, 9)
  execute "nmap <leader><tab>" . i . " :tabn" . i . "<CR>"
endfor

" - Buffers
nmap <leader>bb :Buffers<CR>
nmap <leader>bn :bprev<CR>
nmap <leader>bp :bnext<CR>
nmap <leader>bd :bdelete<CR>
nmap <leader>b!d :bdelete!<CR>

" - File
function! DeleteFile() abort
  let curline = getline('.')
  call inputsave()
  let confirm = input('Do you want to delete current file? [y/N]: ')
  call inputrestore()
  if confirm ==? "y"
    :Delete
  endif
endfunction
nmap <leader>fD :call DeleteFile()<CR>
nmap <leader>fR :Rename<SPACE>
nmap <Leader>fe :e %:h/

" - CoC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

