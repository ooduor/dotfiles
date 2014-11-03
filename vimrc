" Use Vim settings. rather than Vi settings
" This must be first, because it changes other options as a side effect.
set nocompatible               " required
filetype off                   " required

" ================ General Config ================

set nu                         " Line numbers on
set backspace=indent,eol,start " Allow backspace in insert mode
set history=1000               " Store lots of :cmdline history
set showcmd                    " Show incomplete cmds down the bottom
set mousehide                  " Hide the mouse cursor while typing

set enc=utf-8                  " File encoding
scriptencoding utf-8

set autowrite                  " Automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT     " Abbrev. of messages (avoids 'hit enter')
set virtualedit=onemore        " Allow for cursor beyond last character
set spell                      " Spell checking on
set tabpagemax=15              " Only show 15 tabs
set linespace=0                " No extra spaces between rows
set showmatch                  " Show matching brackets/parenthesis
set incsearch                  " Find as you type search
set hlsearch                   " Highlight search terms ON
set winminheight=0             " Windows can be 0 line high
set ignorecase                 " Case insensitive search
set smartcase                  " Case sensitive when uc present
set whichwrap=b,s,h,l,<,>,[,]  " Backspace and cursor keys wrap too
set nolist
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

if has('cmdline_info')
    set ruler " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                " Show partial commands in status line and Selected characters/lines in visual mode
endif

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" ================ Color scheme ================
set background=dark             " To use dark theme

if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        color solarized " Load a colorscheme
endif


set showmode                   " Show current mode down the bottom
set gcr=a:blinkon0             " Disable cursor blink
set visualbell                 " No sounds
set autoread                   " Reload files changed outside vim
set hidden                     " Allow buffer switching without saving
syntax on		       " Syntax highlighting

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
endif

" ================ Indentation ======================

set autoindent                         " Indent at the same level of the previous line
set smartindent                        " Automatically inserts one extra level of indentation
set smarttab                           " Uses shiftwidith instead of tabstop at start of lines
set shiftwidth=4                       " Use indents of 4 spaces
set softtabstop=4                      " Let backspace delete indent
set tabstop=4                          " An indentation every four columns
set expandtab                          " Tabs are spaces, not tabs
set nojoinspaces                       " Prevents inserting two spaces after punctuation on a join (J)
set splitright                         " Puts new vsplit windows to the right of the current
set splitbelow                         " Puts new split windows to the bottom of the current

filetype plugin on
filetype indent on

" ================ Display tabs and trailing spaces visually =======

set list listchars=tab:\ \ ,trail:·
set nowrap                  " Don't wrap lines
set linebreak               " Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent             " fold based on indent
set foldnestmax=3                 " deepest fold is 3 levels
set nofoldenable                  " dont fold by default

" ================ Completion =======================

set wildmode=list:longest,full    " Command <Tab> completion, list matches, then longest common part, then all
set wildmenu                      "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8                " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15           " Minimum lines to keep above and below cursor 
set scrolljump=5               " Lines to scroll when cursor leaves screen
set sidescroll=1


" ================ Highlight cursor line =============

highlight clear SignColumn      " SignColumn should match background                 
highlight clear LineNr          " Current line number row will have same background color in relative mode
let g:CSApprox_hook_post = ['hi clear SignColumn'] "highlight clear CursorLineNr   Remove highlight color from current line number




" Key (re)Mappings
let mapleader = ","
let g:mapleader = ","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" Deps 
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'mileszs/ack.vim'


" General 
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-surround'
Plugin 'townk/vim-autoclose'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/sessionman.vim'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/powerline', {'rtp':'/powerline/bindings/vim'}
Plugin 'bling/vim-bufferline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'godlygeek/csapprox'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mbbill/undotree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mhinz/vim-signify'
Plugin 'osyo-manga/vim-over'
Plugin 'tpope/vim-vinegar'

" Programming
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'

" Snippets & AutoComplete 
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/neocomplete.vim.git'

" Python
Plugin 'klen/python-mode'
Plugin 'python.vim'
Plugin 'python_match.vim'
Plugin 'pythoncomplete'

" Javascript
Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'
Plugin 'kchmck/vim-coffee-script'

" Java
Plugin 'derekwyatt/vim-scala'
Plugin 'derekwyatt/vim-sbt'

" Haskell
Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'hail2u/vim-css3-syntax'
" Plugin 'gorodinskiy/vim-coloresque'
Plugin 'tpope/vim-haml'

" Go 
Plugin 'Blackrush/vim-gocode'

" Twig 
Plugin 'beyondwords/vim-twig'

" All of your Plugins must be added before the following line
call vundle#end()            " required



" Plugins


" Misc {
        let g:NERDShutUp=1
        let b:match_ignorecase = 1
    " }

" ================ neocomplete configuration ================
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" ================ end of neocomplete configuration ==============


" Ctags {
        set tags=./tags;/,~/.vimtags

        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
            let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
    " }

" NerdTree {
        map <C-e> <plug>NERDTreeTabsToggle<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    " }

" vim-airline {
        " Set configuration options for the statusline plugin vim-airline.
        " Use the powerline theme and optionally enable powerline symbols.
        " To use the symbols , , , , , , and .in the statusline
        " segments add the following to your .vimrc.before.local file:
           let g:airline_powerline_fonts=1
        " If the previous symbols do not render for you then install a
        " powerline enabled font.

        " See `:echo g:airline_theme_map` for some more choices
        " Default in terminal vim is 'dark'
        if !exists('g:airline_theme')
            let g:airline_theme = 'solarized'
        endif
        if !exists('g:airline_powerline_fonts')
            " Use the default set of separators with a few customizations
            let g:airline_left_sep='›'  " Slightly fancier than '>'
            let g:airline_right_sep='‹' " Slightly fancier than '<'
        endif
    " }
