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
Plug '/usr/bin/fzf'
" install fzf wrapper plugin of vim
Plug 'junegunn/fzf.vim'

" file tree in current directory
" <ctrl>-n to toggle
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Airline enhancing bottom line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'
Plug 'airblade/vim-gitgutter'

" Tagbar is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure
" <F9> to toggle
Plug 'majutsushi/tagbar'

" vim go plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Use coc instead of old ycm
" Use release branch
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Or latest tag
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" Or build from source code by use yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" List TODOs 
Plug 'vim-scripts/TaskList.vim'

" rainbow parentheses improved
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" EasyFold only for Python
Plug 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview = 1

" indentation indication
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '|'

" vim autoformat :Autoformat to call
Plug 'Chiel92/vim-autoformat'


" Vim JavaScip
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
" Plug 'isRuslan/vim-es6'

" Vim JSON
Plug 'elzr/vim-json'

" Vim Python
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'sbdchd/neoformat'

" Vim Coffeescript
Plug 'kchmck/vim-coffee-script'

" devicons
Plug 'ryanoasis/vim-devicons'
" dracula
Plug 'dracula/vim'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Dart
Plug 'dart-lang/dart-vim-plugin'
" end of plugins settings
call plug#end()

" Beiginning of general configuration

" magic of using vim
set nocompatible

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

" use space to all tab, set indentation to 4
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

" show matched brackets and so on
set showmatch

" fold method
set foldmethod=syntax
set foldlevelstart=99

" sepcial indentation for jsx and coffeescript
autocmd FileType javascript.jsx setlocal tabstop=2 shiftwidth=2 noexpandtab
autocmd BufNewFile,BufReadPost *.coffee setl tabstop=2 shiftwidth=2 expandtab foldmethod=manual
" support jsonc comment
autocmd FileType json syntax match Comment +\/\/.\+$+

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
nnoremap H gT
nnoremap L gt
" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" easier split vertical resize
nnoremap <S-Up> <C-w>+
nnoremap <S-Down> <C-w>-
nnoremap <S-Right> <C-w>>
nnoremap <S-Left> <C-w><

" neovim terminal Esc key mapping
" nnoremap <Leader>sh :belowright split term://zsh<CR>
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
endif
" clipboard setting
"See https://stackoverflow.com/questions/11489428/how-to-make-vim-paste-from-and-copy-to-systems-clipboard
if has('clipboard')
  if has('unnamedplus') " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else                  " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

" Vim general settings for coc
" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" plugin settings 
" vim-plug
" install plugin using vim-plug
map <leader>pi :PlugInstall<CR>
map <leader>cl :PlugClean<CR>

" tagbar toggle mapping
nmap <F9> :TagbarToggle<CR>

" nerdcomment
" use gcc to quickly toggle comments in normal and visual mode
nnoremap gcc :call NERDComment(0,"toggle")<CR>
vnoremap gcc :call NERDComment(0,"toggle")<CR>

" GitGutter
nmap <right><right> <Plug>(GitGutterNextHunk)
nmap <left><left> <Plug>(GitGutterPrevHunk)
nmap gua <Plug>(GitGutterUndoHunk)
nmap gpr <Plug>(GitGutterPreviewHunk)

" Nerdtree
" open nerdtree automatically when nvim open
" autocmd vimenter * NERDTree
" close vim if the only window left is open is nerd tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" nerdtree key shortcuts
map <C-n> :NERDTreeToggle<CR>

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
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
" F10 for coverage report
au FileType go nmap <F10> :GoCoverageToggle -short<cr>

" TODO: JavaScript Configuration
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1
let g:neoformat_enabled_javascript = ['prettier']

" TODO: Python Configuration
let g:neoformat_enabled_python = ['autopep8', 'isort']

" Flutter Configuration
let g:dart_style_guide = 2
let dart_html_in_string=v:true
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
" fzf open action
let g:fzf_action = {
  \ 'ctrl-e': 'edit',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


" autocomplete for :Git checkout <branch>
function! s:gitCheckoutRef(ref) 
    execute('Git checkout ' . a:ref)
endfunction

function! s:gitListRefs()
   let l:refs = execute("Git for-each-ref --format='\\%(refname:short)'")
   return split(l:refs,'\r\n*')[1:] "jump past the first line which is the git command
endfunction

command! -bang Gbranch call fzf#run({ 'source': s:gitListRefs(), 'sink': function('s:gitCheckoutRef'), 'dir':expand('%:p:h') })

" customize Rg with preview
let $BAT_THEME = 'TwoDark'
let $FZF_PREVIEW_COMMAND = 'bat --color=always {} || cat {} || tree -C {}'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --no-heading --line-number --color=always '.shellescape(<q-args>),
  \ 1,
  \ fzf#vim#with_preview(),
  \ <bang>0)
" fzf now has Rg command built in
nnoremap <silent> <Leader>f :Rg<CR>

" COC.nvim
" coc configuration
let g:coc_node_path='/Users/lhan/.nvm/versions/node/v10.15.3/bin/node'

function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')

" GOTO of coc
nmap <silent> <F12> <Plug>(coc-definition)

" using tab to cycle through suggestion list
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" : "\<TAB>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" terminal
"
tnoremap <silent> <C-t> <C-\><C-n>:call ToggleTerminal(12)<Enter>
nnoremap <silent> <C-t> :call ToggleTerminal(12)<Enter>
" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! ToggleTerminal(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction
