" Vundles

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'bling/vim-airline'
Plugin 'igagen/bclose.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'Shougo/neocomplete.vim'

Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'
Plugin 'tpope/vim-haml'
Plugin 'vim-ruby/vim-ruby'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-rails'
Plugin 'slim-template/vim-slim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'croaker/mustang-vim'
Plugin 'rainux/vim-desert-warm-256'
Plugin 'fmoralesc/vim-vitamins'
Plugin '29decibel/codeschool-vim-theme'
Plugin 'vim-scripts/xoria256.vim'
Plugin 'fatih/molokai'
Plugin 'sickill/vim-monokai'

call vundle#end()

" Settings

syntax on
"set omnifunc=syntaxcomplete

let g:scheme = 'dark'
if g:scheme == 'light'
  set background=light
  colorscheme solarized
elseif g:scheme == 'dark'
  colorscheme monokai
endif

set fillchars+=vert:\ 
set t_Co=256                                  " 256 color mode
set hidden                                    " hidden buffers
set backspace=2                               " enable backspace past entered text in insert mode
set dir=>~/.vimswaps//                        " put swap files in a single external location
set cmdheight=1
set laststatus=2
set splitbelow                                " default horizontal split location
set splitright                                " default vertical split location
set cursorline
set showcmd
set scrolloff=4                               " provide additional lines of context when jumping between search results
set number                                    " line numbers
highlight LineNr ctermfg=darkgrey ctermbg=bg
highlight CursorLine cterm=NONE
set linebreak
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set showmatch                                 " show matching paren/brace/etc
set list                                      " show invisibles
" set listchars=trail:·
set listchars=tab:»\ ,trail:·
set conceallevel=2 concealcursor=nv
set timeoutlen=1000 ttimeoutlen=0             " switch modes instantly
set wildignore+=dist,node_modules,client/lib,client/fonts,client/images
filetype plugin indent on                     " use filteype specific indentation
let g:airline#extensions#tabline#enabled = 1
let g:CommandTCancelMap=['<ESC>','<C-c>']     " dismiss Command-T with Esc
let g:neocomplete#enable_at_startup = 1

" Mappings

let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

map <leader>w :w!<cr>
map <leader>q :q<cr>
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>d :Bclose<cr>
map <leader>o <C-w>o<cr>
map <leader>v :vsp<cr>
map <leader>h :sp<cr>
map <leader>co :copen<cr>
map <leader>cc :cclose<cr>
map <Leader>t :CommandT<cr>
map <Leader>f :CommandTFlush<cr>
map <leader>e :NERDTreeToggle<cr>
map <leader>r :tabedit $MYVIMRC<cr>
map <leader>g !git status<cr>
map <leader>0 :set number!<cr>                " toggle line numbers
map <leader>i :set list!<cr>                  " show invisibles
map <leader>= :resize +1<cr>
map <leader>- :resize -1<cr>
map <leader>. :vertical resize +5<cr>
map <leader>, :vertical resize -5<cr>
map <leader>a :setlocal paste! paste?<cr>

" Quicker window navigation
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>

" Navigate autocomplete options with j/k
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("<C-j>"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("<C-k>"))

" Misc

" let exclude = ['go']
" autocmd BufWritePre * if index(exclude, &ft) < 0 | :%s/\s\+$//e   "strip trailing whitespace on save
" autocmd BufWritePre * :%s/\s\+$//e   "strip trailing whitespace on save

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" Neocomplete

if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif

let g:neocomplete#keyword_patterns['default'] = '\h\w*'
let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
let g:neocomplete#enable_at_startup = 1 " Use neocomplete.
let g:neocomplete#enable_smart_case = 1 " Use smartcase.
let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length.
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = { 'default' : '', 'vimshell' : $HOME.'/.vimshell_hist', 'scheme' : $HOME.'/.gosh_completions' } " Define dictionary.

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
