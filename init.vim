" Plugins enabled using vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" fast commenting
" See https://github.com/scrooloose/nerdcommenter
" gcc to toggle comment
Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Surround is about change/add surroundings of code
" See https://github.com/tpope/vim-surround
Plug 'git://github.com/tpope/vim-surround.git'
" for repeat -> enhance surround.vim, . to repeat command
Plug 'tpope/vim-repeat'

" fuzzy search everything utilizing fzf
" if fzf is installed via homebrew
Plug '/usr/local/opt/fzf'
" install fzf wrapper plugin of vim
Plug 'junegunn/fzf.vim'

" file tree in current directory
" <leader>dir to toggle
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Airline enhancing bottom line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" see git branch in airline
Plug 'tpope/vim-fugitive'

"see https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

" fast buffer switch: <leader>bt to open
Plug 'jlanzarotta/bufexplorer'

" Tagbar is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure
" <leader>tag
Plug 'majutsushi/tagbar'

" vim go plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Code complete engine
" For javascript developers: tern is not maintained and YCM switched to
" TSServer which I reckon is better
Plug 'Valloric/YouCompleteMe',{'frozen':'true'}

" List TODOs 
Plug 'vim-scripts/TaskList.vim'

" rainbow parentheses improved
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" indentation indication
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '|'
" vim autoformay :Autoformat to call
Plug 'Chiel92/vim-autoformat'

" dracula
Plug 'dracula/vim'

" Vim JavaScript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'isRuslan/vim-es6'

" Vim JSON
Plug 'elzr/vim-json'

" Vim Python
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'sbdchd/neoformat'

" end of plugins settings
call plug#end()

" fundamental settings
" use dracula theme as the color theme
colorscheme dracula

" improve neovim performance slightly
set  nocursorcolumn
set nocursorline

" set layout format
syntax sync minlines=256
set synmaxcol=200
set scrolljump=5
" control whether highlight current line
:hi CursorLine   cterm=NONE ctermbg=240 ctermfg=white guibg=188 guifg=white

" file encoding
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1

" set tab size and indentation to 4
set tabstop=4
set shiftwidth=4
set expandtab

" turn on line number
set number
" abosolute line number in normal mode
" relative line number in insert mode
autocmd InsertLeave * :set norelativenumber number
autocmd InsertEnter * :set relativenumber

" find as typing
set incsearch
" highlight search terms
set hlsearch
" ignore case when searching
set ignorecase
" if search input contains upper case, do not ignore
set smartcase
" toggle file type on
filetype on
" toggle plugin on
filetype plugin on
" toggle plugin indent on
filetype plugin indent on
" enable syntax
syntax enable
" allow to use mouse
set mouse=a
set mousehide
" turn on spell check
set nospell
" smart indentation
set smartindent
" set autoindent
" show matched brackets and so on
set showmatch
autocmd FileType javascript.jsx setlocal tabstop=2
autocmd FileType javascript.jsx setlocal shiftwidth=2


" basic key mappings and shortcuts
" map leader to <Space>
let mapleader="\<SPACE>"
" doubel press esc to disable highlight in current document
map <esc><esc> :noh<return> 
" change <ESC> to jj
imap jj <ESC>
" use <Leader>+cur to toggle highlight current line
:nnoremap <Leader>cur :set cursorline! cursorcolumn!<CR>
" visual shifting
vnoremap < <gv
vnoremap > >gv
" tab move
noremap <C-L> <Esc>:tabnext<CR>
noremap <C-H> <Esc>:tabprevious<CR>

" clipboard setting
"See https://stackoverflow.com/questions/11489428/how-to-make-vim-paste-from-and-copy-to-systems-clipboard
if has('clipboard')
  if has('unnamedplus') " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else                  " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

" plugin settings 
" vim-plug
" install plugin using vim-plug
map <leader>pi :PlugInstall<CR>

" tagbar toggle mapping
nmap <F8> :TagbarToggle<CR>

" nerdcomment
" use gcc to quickly toggle comments in normal and visual mode
nnoremap gcc :call NERDComment(0,"toggle")<CR>
vnoremap gcc :call NERDComment(0,"toggle")<CR>

" GitGutter
nmap ]] <Plug>GitGutterNextHunk
nmap [[ <Plug>GitGutterPrevHunk
nmap gua <Plug>GitGutterUndoHunk
nmap gpr <Plug>GitGutterPreviewHunk

" Nerdtree
" open nerdtree automatically when nvim open
autocmd vimenter * NERDTree
" close vim if the only window left is open is nerd tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" nerdtree key shortcuts
map <C-n> :NERDTreeToggle<CR>

" YouCompleteMe
" YouCompleteMe GoToDefinition
nnoremap <F12> :YcmCompleter GoToDefinition<cr>

" Go Configuration
autocmd BufWritePre *.go :GoBuild
" Go highlight
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
" highlight the same ids
let g:go_auto_sameids = 1
" import when format
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
" add json tags automatically
let g:go_addtags_transform = "snakecase"
" F9 for coverage report
au FileType go nmap <F9> :GoCoverageToggle -short<cr>
" F12 for go to definition - using ycm completer now
au FileType go nmap <F12> <Plug>(go-def)

" TODO: JavaScript Configuration
let g:javascript_plugin_jsdoc = 1
let g:neoformat_enabled_javascript = ['prettier']

" TODO: Python Configuration
let g:neoformat_enabled_python = ['autopep8', 'isort']

" Ale configuration: lint plugin
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1

" fzf configuration
" ctrlp files fuzzy search using fzf
nmap <C-p> :Files<CR>
" buffer fuzzy search 
nmap <C-e> :Buffers<CR>
" quickly switch to last open buffer
let g:fzf_action = { 'ctrl-e': 'edit' }
" autocomplete for :Git checkout <branch>
function! s:gitCheckoutRef(ref) 
    execute('Git checkout ' . a:ref)
    " call feedkeys("i")
endfunction
function! s:gitListRefs()
   let l:refs = execute("Git for-each-ref --format='\\%(refname:short)'")
   return split(l:refs,'\r\n*')[1:] "jump past the first line which is the git command
endfunction
command! -bang Gbranch call fzf#run({ 'source': s:gitListRefs(), 'sink': function('s:gitCheckoutRef'), 'dir':expand('%:p:h') })
