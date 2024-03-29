" not a vi
set nocompatible
set encoding=utf-8

" start vundler
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" core plugins
Bundle "gmarik/vundle"
Bundle "flazz/vim-colorschemes"
Bundle "whatyouhide/vim-gotham"
Bundle "chriskempson/base16-vim"
Bundle "kien/ctrlp.vim"

" vim main plugins
Bundle "sjl/gundo.vim"
Bundle "bling/vim-airline"
Bundle "jlanzarotta/bufexplorer"
Bundle "scrooloose/syntastic.git"
Bundle "vim-scripts/tComment"
Bundle "Shougo/unite.vim"
Bundle "tpope/vim-surround"
Bundle "mileszs/ack.vim"
Bundle "rking/ag.vim"
Bundle "edsono/vim-matchit"
Bundle "tpope/vim-fugitive"
Bundle "henrik/vim-indexed-search"
Bundle "tpope/vim-abolish"
Bundle "tpope/vim-repeat"
Bundle "jiangmiao/auto-pairs"
Bundle "xolox/vim-session"
Bundle "xolox/vim-misc"
Bundle "editorconfig/editorconfig-vim"
Bundle "godlygeek/tabular"
Bundle "airblade/vim-gitgutter"
Bundle "Lokaltog/vim-easymotion"
Bundle "rhysd/clever-f.vim"
Bundle "mhinz/vim-startify"

" togglable panels
Bundle "scrooloose/nerdtree"
Bundle "tpope/vim-vinegar"
Bundle "vim-scripts/taglist.vim"
Bundle "majutsushi/tagbar"

" language vundles
Bundle "pangloss/vim-javascript"
Bundle "marijnh/tern_for_vim"
Bundle "kchmck/vim-coffee-script"
Bundle "othree/javascript-libraries-syntax.vim"

" haskell

Bundle "raichoo/haskell-vim"
Bundle "enomsg/vim-haskellConcealPlus"
Bundle "eagletmt/ghcmod-vim"
Bundle "eagletmt/neco-ghc"
Bundle "Twinside/vim-hoogle"
Bundle "pbrisbin/html-template-syntax"


Bundle "kana/vim-textobj-user"

Bundle "fatih/vim-go"
Bundle "plasticboy/vim-markdown"

" databases
Bundle "krisajenkins/dbext.vim"
Bundle "vim-scripts/SQLComplete.vim"
Bundle "vim-scripts/SQLUtilities"
Bundle "NagatoPain/AutoSQLUpperCase.vim"

" autocomplete
Bundle "Valloric/YouCompleteMe"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"

" snippets
" Bundle "garbas/vim-snipmate"
Bundle "SirVer/ultisnips"
Bundle "honza/vim-snippets"

" enable all the plugins
filetype plugin indent on

" general configs
set number 
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=2
set tabstop=4
set autoindent
set hidden
set ignorecase
set smartcase
set showmatch
set incsearch
set hls
"set relativenumber
set ls=2
"set cursorline
set nowrap
set backspace=indent,eol,start
set shell=/bin/bash
set completeopt -=preview
set textwidth=95
set wildmenu
set ttyfast
set noshowmode
set cmdheight=1

if has('cmdline_info')
    set ruler " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                " Show partial commands in status line and Selected characters/lines in visual mode
endif


" set autoread

let mapleader=","

" realign buffers when iterm goes fullscreen
augroup FixProportionsOnResize
  au!
  au VimResized * exe "normal! \<c-w>="
augroup END

" vim mode-switch lag fix
if ! has("gui_running")
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" macos vs linux clipboard
if has("mac")
  set clipboard+=unnamed
else
  set clipboard=unnamedplus
endif

" make C-a, C-x work properly
set nrformats=

" potential lag fix
let g:matchparen_insert_timeout=1

" fix bufexplorer bug with hidden
let g:bufExplorerFindActive=0

" show trailing whitespaces
set list
set listchars=tab:▸\ ,trail:¬,nbsp:.,extends:❯,precedes:❮

augroup ListChars2
    au!
    autocmd filetype go set listchars+=tab:\ \ 
    autocmd ColorScheme * hi! link SpecialKey Normal
augroup END

" syntax highlighting
syntax on
" ================ Color scheme ================
set background=dark             " To use dark theme
if filereadable(expand("~/.vim/bundle/base16-vim/colors/base16-solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        color solarized " Load a colorscheme
endif
"colorscheme base16-solarized
highlight LineNr ctermbg=NONE guibg=NONE



set paste
" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession 
nnoremap <leader>ss :SaveSession 
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" backup/persistance settings
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile

" persist (g)undo tree between sessions
set undofile
set history=100
set undolevels=100

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" visual reselect of just pasted
nnoremap gp `[v`]

"make enter break and do newlines
nnoremap <CR> O<Esc>j
nnoremap <leader>j i<CR><Esc>==

"make space in normal mode add space
nnoremap <Space> i<Space><Esc>l

" consistent menu navigation
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" intellij style autocomplete shortcut
inoremap <C-@> <C-x><C-o>
inoremap <C-Space> <C-x><C-o>

" togglables without FN keys
nnoremap <leader>1 :GundoToggle<CR>
set pastetoggle=<leader>2
nnoremap <leader>3 :TlistToggle<CR>
nnoremap <leader>4 :TagbarToggle<CR>
nnoremap <leader>5 :NERDTreeToggle<CR>


" ctrlP config
let g:ctrlp_map = "<c-p>" 
let g:ctrlp_cmd = "CtrlP"       
let g:ctrlp_working_path_mode = "ra"        
         
" Exclude files and directories         
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"        
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$' 

" clever-f prompt
let g:clever_f_show_prompt = 1
let g:clever_f_across_no_line = 1

" easy motion rebinded
nmap <leader>f <Plug>(easymotion-f2)
nmap <leader>F <Plug>(easymotion-F2)

" open vimrc
nnoremap <leader>v :e  ~/.vimrc<CR>
nnoremap <leader>V :tabnew  ~/.vimrc<CR>

" reload all open buffers
nnoremap <leader>Ra :tabdo exec "windo e!"

"map next-previous jumps
nnoremap <leader>m <C-o>
nnoremap <leader>. <C-i>

" better navigation
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>

" Use sane regexes
nnoremap <leader>/ /\v
vnoremap <leader>/ /\v

" Use :Subvert search
nnoremap <leader>// :S /
vnoremap <leader>// :S /

" Use regular replace
nnoremap <leader>s :%s /
vnoremap <leader>s :%s /

" Use :Subvert replace
nnoremap <leader>S :%S /
vnoremap <leader>S :%S /

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" airline
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif

let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
" let g:airline_section_warning = airline#section#create([ "syntastic" ])
let g:airline#extensions#branch#empty_message  =  "No SCM"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter

" Visual Mode */# from Scrooloose
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" Text Highlighter = <leader>hx
function! HiInterestingWord(n)
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction

nnoremap <leader>hh :call clearmatches()<CR>:noh<CR>
nnoremap <silent> <leader>h1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>h2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>h3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>h4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>h5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>h6 :call HiInterestingWord(6)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

highlight search ctermfg=white ctermbg=3423513

function! s:CopyMotionForType(type)
    if a:type ==# "v"
        silent execute "normal! `<" . a:type . "`>y"
    elseif a:type ==# "char"
        silent execute "normal! `[v`]y"
    endif
endfunction

function! s:AckMotion(type) abort
    let reg_save = @@

    call s:CopyMotionForType(a:type)

    execute "normal! :Ack! --literal " . shellescape(@@) . "\<cr>"

    let @@ = reg_save
endfunction

if executable("ag")
  let g:ackprg = "ag --nogroup --column"
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" git and ack stuff
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
nnoremap <leader>G mG:Git! 
nnoremap <leader>g :Git 
nnoremap <leader>A :!ag 
nnoremap <leader>a :Ag! 

" reload ctags
nnoremap <leader>C :!ctags -R --exclude=.git --exclude=log --exclude=tmp *<CR><CR>


" General file runners for various languages
function! LangRunner()
  if(&ft=="python")
    nnoremap <leader>r :!python2 %<cr>
  elseif(&ft=="javascript")
    nnoremap <leader>r :!node %<cr>
  elseif(&ft=="dart")
    nnoremap <leader>r :!dart %<cr>
  endif
endfunction

au BufEnter * call LangRunner()

" YouCompleteMe
let g:ycm_filetype_blacklist = {}
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_key_invoke_completion = "<C-j>"
let g:ycm_collect_identifiers_from_tags_files = 1

" enable angular syntax
let g:used_javascript_libs = 'jquery,angularjs'

" retab
fu! Retab()
  :retab
  :%s/\s\+$//
endfunction

" THINGS TODO ON NEW INSTALL
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
" Inside of ~/.vim make /tmp, inside of which mkdir swap backup undo
"
" install ctags, ack, ag
" sudo packer -S silver-searcher-git ack ctags
"
" cd ~/.vim/bundle/YouCompleteMe
" ./install.sh --clang-completer
"
" cd .vim/bundle/tern_for_vim/ && npm install
" npm install -g jshint
