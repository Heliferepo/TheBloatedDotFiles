"██╗  ██╗███████╗██╗     ██╗███████╗███████╗      ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"██║  ██║██╔════╝██║     ██║██╔════╝██╔════╝      ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"███████║█████╗  ██║     ██║█████╗  █████╗        ██║   ██║██║██╔████╔██║██████╔╝██║
"██╔══██║██╔══╝  ██║     ██║██╔══╝  ██╔══╝        ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"██║  ██║███████╗███████╗██║██║     ███████╗    ██╗╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚═╝     ╚══════╝    ╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"Maintainer:    Dalleau Mattis's (alias Helife) .vimrc
"
"License:       This file is placed in the public domain
"
"Last_Change:   Thursday 9 July 21:12 GMT+4
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Prepare Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Avoid modeline vulnerability
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nomodeline
"No lines are checked

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Source the Vimrc when i am done
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"autocmd bufwritepost .vimrc source %
"Source when you :w
"Not compatible with quickui

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Presets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
"Set highlighting everytime

set title
"Set the title on the top bar

set ruler
"Numbers on bottom right

set relativenumber
"Relative numbers to navigate faster

autocmd VimEnter * set number
"give the current line with relativenumber set on
"Can also be used to get a normal line column when relativenumber is off

set nocompatible
"To avoid unexpected things of your distro
"This may ward off some things

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remove useless 'addons'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nowrap
"Vim won't do a \n to show the line but will continue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"No annoying sound on errors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set noerrorbells
"No screen flash

set novisualbell
"No beep sounds

set t_vb=
"Empty Visual Bell

"Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Avoid Vim to Bug (or whatever) at Startup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set shortmess=atIc
"             ||||
" Shortens    ||||
" status      ||||
" messages  ---|||
"              |||
" Truncate     |||
" file         |||
" messages -----||
"               ||
" Remove intro  ||
" messages ------|
"                |
" Remove         |
" ins-completion |
" messages -------

set cmdheight=2
"Helps avoiding hit-enter prompt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable filetype plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"command                         detection       plugin          indent
"filetype on                    "on              unchanged       unchanged
"filetype off                   "off             unchanged       unchanged
"filetype plugin on             "on              on              unchanged
"filetype plugin off            "unchanged       off             unchanged
"filetype indent on             "on              unchanged       on
"filetype indent off            "unchanged       unchanged       off
filetype plugin indent on      "on              on              on
"filetype plugin indent off     "unchanged       off             off

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable detection of outside changes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoread
"Detect when a file is changed ouside of Vim

au FocusGained,BufEnter * checktime
"Auto modificator

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Leader key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = " "
"Define a special shortcut command

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set Vim Language
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let $LANG='en'
"Setting env LANG var to english

set langmenu=en
"Setting menu language to en

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"Sourcing evrything ("don't why but you need to do it)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2
"Always show the status line

"Format the status line

set statusline=
"Reset the statusline

set statusline +=%1*\ %n\ %*
"buffer number

set statusline +=%5*%{&ff}%*
"file format

set statusline +=%3*%y%*
"file type

set statusline +=%4*\ %<%F%*
"full path

set statusline +=%2*%m%*
"modified flag

set statusline +=%1*%=%5l%*
"current line

set statusline +=%2*/%L%*
"total lines

set statusline +=%1*%4v\ %*
"virtual column number

set statusline +=%2*0x%04B\ %*
"character under cursor

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Change cursors along with the modes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("autocmd")
    au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
    au InsertEnter,InsertChange *
                \ if v:insertmode == 'i' |
                \   silent execute '!echo -ne "\e[6 q"' | redraw! |
                \ elseif v:insertmode == 'r' |
                \   silent execute '!echo -ne "\e[4 q"' | redraw! |
                \ endif
    au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Use persistent undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('persistent_undo')
    "" Save all undo files in a single location (less messy)...
    silent !mkdir ~/.vim/undodir > /dev/null 2>&1
    set undodir=$HOME/.vim/undodir

    "" Save a lot of back-history...
    set undolevels=5000

    "" Actually switch on persistent undo
    set undofile
endif

set nobackup
"Remove backup ~.swp files

set noswapfile
"They are annoying

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set up smarter search behaviour
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set incsearch
"Lookahead as search pattern is specified

set ignorecase
"Ignore case in all searches...

set smartcase
"unless uppercase letters used

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Red column at 81
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set colorcolumn=81
highlight ColorColum ctermbg=0 guibg=lightgrey

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fix smartindent stupidities
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=4
"Detect column 4 to 4

set shiftwidth=4
"Detect column 4 to 4 for shifting

set expandtab
"Transform tabs to spaces

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"(WIP) Trying out auto indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ai
"Auto Indent

set si
"Smart indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set specials filetypes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufRead,BufNewFile *.md set filetype=markdown
"Set Filtype for markdown

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Ignore 'useless' extensions for wildmenu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildignore+=*.a,*.o,*.so,*.pyc,.git
set wildignore+=*.jpg,*.png,*.gif,*.bmp,*.ico,*.pdf
set wildignore+=*.tmp,*.swp

"Tell NerdTree and Popup windows ignore thoses

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Self Made Minimalist Auto - Complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:chCompleter = 0
"Value setted for the Completer option

function! TabComplete() "Function to use tab instead of weird command in menu popup
    if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
        return "\<C-P>"
    else
        return "\<Tab>"
    endif
endfun

function! AutoComplete() "Function to open the popup window with the right 'completer'
    if v:char =~ '\K'
                \ && getline('.')[col('.') - 4] !~ '\K'
                \ && getline('.')[col('.') - 3] =~ '\K'
                \ && getline('.')[col('.') - 2] =~ '\K' " last char
                \ && getline('.')[col('.') - 1] !~ '\K'
        call feedkeys("\<C-x>\<C-P>", 'n')
    endif
endfun

set completeopt=menu,menuone,noinsert
"                 |   |       |
"                 |   |       |
"Pop to show menu -   |       |
"                     |       |
"Use the popup even   |       |
"with one match -------       |
"                             |
"Do not insert                |
"any text for a match         |
"until the user               |
"select one -------------------

set tags=~/tags; "Set customs ctags give your own custom path for yours

inoremap <expr> <Tab> TabComplete()
"Tab complete will be runned with <TAB> after typing at least 3 char

inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
"Launch Popup if not visible

autocmd InsertCharPre * call AutoComplete()
"Launch AutoComplete at every insertion

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugins Call
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'Heliferepo/VimTek'
"Plugin made by me for the Epitech Curriculum

Plug 'Heliferepo/Easy_compile.vim'
"Plugin to compile fast my programs

Plug 'mbbill/undotree'
"Use better my undodir and undotree

Plug 'preservim/nerdcommenter'
"Comment faster in Visual mode

Plug 'justinmk/vim-syntax-extra'
"Better syntax highlighting

Plug 'tpope/vim-fugitive'
"Git integration

Plug 'skywind3000/vim-quickui'
"Quick menu UI
"Very useful for occasional use of functions
"Do not overuse it will slow you

Plug 'terryma/vim-multiple-cursors'
"Enable multiples cursors

Plug 'mariappan/dragvisuals.vim'
"Enable moving "Visual blocks" in Visual mode

"Plug 'Heliferepo/hlnext.vim'
"Better searching with "special" blinking visual

"Plug 'vim-scripts/c.vim'
"Testing out the c vim reference
"Dope but can be annoying for the Epitech's curriculum
"Might certainly use it outside of school

Plug 'alpertuna/vim-header'
"Cool headers

Plug 'vim-scripts/TeTrIs.vim'
"Make me work my hjkl motion
"And I just love Tetris

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Git integration presets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if executable('rg')
    let g:rg_derive_root='true'
endif
"Allows rg to always detect the root of your .git an use the .gitignore

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Timeout Maps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set timeout
"set timeoutlen=200
"I don't use it with my broken arm because i am too slow with one arm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Blocking arrow keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"Insertion mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Permitting me to move in Insertion mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Move faster in Normal mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <C-h> b
"Move one word behind

nnoremap <C-l> w
"Move one word forward

nnoremap <C-j> 3j
"Move 3 lines upwards

nnoremap <C-k> 3k
"Move 3 lines downward

nnoremap <S-h> 0
"Move to the start of the line

nnoremap <S-l> $
"Move to the end of the line

nnoremap <S-j> gg
"move to the top of the file

nnoremap <S-k> G
"move to the bottom of the file

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"To avoid <ESC> wich is far away
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

imap <ESC> <nop>
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>
inoremap kk <ESC>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Allow scrolling mouse
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"if has('mouse')
"   set mouse=""           " disable mouse
"   set mouse=a " a: all modes, v: visual,
"   set mousemodel=extend
"   set ttymouse=urxvt " make terminal support mouse: xterm/urxvt/...
"endif

"Please do not use it for actually moving everytime
"I only use that because of my broken arm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme slate
"Set up colorscheme

set background=dark
"Set background as dark

let g:quickui_show_tip = 2
"Change the view of the help popup of quick ui

let g:quickui_border_style = 3
"Quick ui borders style

"Colors of the quick ui menu

"Group       Meaning

"QuickBG     Background color
"QuickSel    Selector (or cursor) color
"QuickKey    Hotkey (or shortcut-key) color
"QuickOff    Disabled item color
"QuickHelp   Tip text color

autocmd VimEnter * hi! QuickBG ctermfg=0 ctermbg=lightgrey guifg=black guibg=white
autocmd VimEnter * hi! QuickSel cterm=bold ctermfg=0 ctermbg=darkred gui=bold guibg=brown guifg=gray
autocmd VimEnter * hi! QuickKey term=bold ctermfg=9 gui=bold guifg=#f92772
autocmd VimEnter * hi! QuickOff ctermfg=59 guifg=#75715e
autocmd VimEnter * hi! QuickHelp ctermfg=247 guifg=#959173

" Make the completion popup look menu-ish...
highlight  Pmenu        ctermbg=black       ctermfg=lightgrey
highlight  PmenuSel     ctermbg=darkred     ctermfg=white   cterm=bold
highlight  PmenuSbar    ctermbg=grey        ctermfg=grey
highlight  PmenuThumb   ctermbg=darkgrey    ctermfg=blue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Make Visual modes better
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Visual Block mode is far more useful that Visual mode (so swap thecommands)...
nnoremap v <C-V>
nnoremap <C-V> v

xnoremap v <C-V>
xnoremap <C-V> v

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Make arrows keys move in selections around
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vmap <expr><C-h> DVB_Drag('left')
"Moving a selection in block mode to the left

vmap <expr><C-j> DVB_Drag('down')
"Moving a selection in block mode downwards

vmap <expr><C-k> DVB_Drag('up')
"Moving a selection in block mode upwards

vmap <expr><C-l> DVB_Drag('right')
"Moving a selection in block mode to the right

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Toogle Higlighting search results
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap ,h :set hlsearch<CR>
"Toogle on highlighting

nmap ,hh :set nohlsearch<CR>
"Toogle off highlighting

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"To move beetween screens
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>h :wincmd h<CR>
"Move to the left screen

nnoremap <leader>j :wincmd j<CR>
"Move to the down screen

nnoremap <leader>k :wincmd k<CR>
"Move to the left screen

nnoremap <leader>l :wincmd l<CR>
"Move to the right screen

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Manage screen sizes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <Leader>+ :vertical resize +5<CR>
"Resize +5 the current window

nnoremap <silent> <Leader>- :vertical resize -5<CR>
"Resize -5 the current window

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Toogle UndoTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>u :UndotreeShow<CR><bar>:wincmd h<CR>
"Toogle UndoTree and sets you in

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Git (vim-fugitive) shortcut commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap ,ga    :Git add %:p<CR><CR>
nnoremap ,gs    :Gstatus<CR>
nnoremap ,gc    :Gcommit -v -q<CR>
nnoremap ,gt    :Gcommit -v -q %:p<CR>
nnoremap ,gd    :Gdiff<CR>
nnoremap ,ge    :Gedit<CR>
nnoremap ,gr    :Gread<CR>
nnoremap ,gw    :Gwrite<CR><CR>
nnoremap ,gl    :silent! Glog<CR>:bot copen<CR>
nnoremap ,gp    :Ggrep<Space>
nnoremap ,gm    :Gmove<Space>
nnoremap ,gb    :Git branch<Space>
nnoremap ,go    :Git checkout<Space>
nnoremap ,gps   :Dispatch! git push<CR>
nnoremap ,gpl   :Dispatch! git pull<CR>

"Do not need to comment evrything
"If you know how to use Git you understand wich key does what

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Headers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"WARNING :  If you enable c.vim you might encounter issues for your Headers
"           c.vim is a great plugin but sets Header in auto mode :( that's annoying
"           You might also have VimTek Headers enabled by default ! :)

"Presets fir vim-header
let g:header_field_author = 'Author'
let g:header_field_author_email = '@.com'
let g:header_auto_add_header = 0
let g:header_field_license_id = 'BSD-3-Clause'
let g:header_field_copyright = 'Copyright (c), Author. All rights reserved.'
map <F1> :AddHeader<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Opening quick UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <silent><leader><leader> :call quickui#menu#open()<CR>
"Open quick ui top bar

nnoremap <silent><leader>, :call quickui#tools#clever_context('k', g:context_menu_k, {})<cr>
"Open quick ui second menu

function! TermExit(code) "Safe exit for terminal
    echom "terminal exit code: ". a:code
endfunction

let opts = {'w':60, 'h':16, 'callback':'TermExit'}
"Set terminal at 60 width 16 of height and use TermExit function when exiting

let opts.title = 'Zsh Popup'
"Set the popup name of the Terminal

nnoremap <leader>sh :call quickui#terminal#open('zsh', opts)<CR>
"Launch the terminal popup
"If you want to try out vim has also a built in :h terminal

nnoremap M "ayiw:!man<C-R>a<CR>
"Not part of quick ui plugin but part of quick check
"Open man page of current word

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Miss spelled section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command WQ wq
command Wq wq
command W w
command Q q
command Sp sp
command SP sp
command Vs vs
command VS vs
command Cn cn
command ANU set rnu | set nu
command ASNU set nornu | set nonu
nnoremap ; :


iab retrun  return
iab pritn  print
iab teh  the
iab liek  like
iab liekwise  likewiseiab
iab Pelr  Perl
iab pelr  perl
iab jarrko  jar
iab moer  more
iab previosu  previous

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Abrev Shebangs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

abbrev _sh #!/usr/bin/env sh
abbrev _py #!/usr/bin/env python
abbrev _ruby #!/usr/bin/env ruby
abbrev _perl #!/usr/bin/env perl
abbrev _js #!/usr/bin/env javascript

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Quick UI Management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"To understand all of this refer to
"https://github.com/skywind3000/vim-quickui/blob/master/MANUAL.md

"This only a little portion that you can do with vim
"Please be used to vim defaults bindings before using this 'life changing' plug

call quickui#menu#reset()
"Just to make sure evrything does not break when launching vim

call quickui#menu#install('&File', [
            \ [ "&Open New File\tCurrent(:Explore)", 'Explore' ],
            \ [ "&Open New File\tVertical(:Vexplore)", 'Vexplore' ],
            \ [ "&Open New File\tHorizontal(:Sexplore)", 'Sexplore' ],
            \ [ "--", '' ],
            \ [ "&UndoTree\t:UndotreeShow", 'UndotreeShow' ],
            \ [ "&Indent file\tmagg=`a", 'call feedkeys("magg=G`a")' ],
            \ [ "&Trailing Spaces Remover\t:call CleanExtraSpaces()", 'call CleanExtraSpaces() | echo "Rest in peace now"' ],
            \ [ "--", '' ],
            \ [ "&Save\t:w", 'w' ],
            \ [ "&Save and quit\t:wq", 'wq' ],
            \ [ "--", '' ],
            \ [ "&Exit\t:q", 'q' ],
            \ [ "&Force exit\t:q!", 'q!' ],
            \ ])

call quickui#menu#install('&Compile', [
            \ [ "&Make\t:make", 'make' ],
            \ [ "--", '' ],
            \ [ "&Compile\t:Compile", 'Compile' ],
            \ [ "&Save and compile\t:w | Compile", 'w | Compile' ],
            \ [ "--", '' ],
            \ [ "&Open Quick fix list\t:copen", 'copen' ],
            \ [ "&Close Quick fix list\t:ccl", 'ccl' ],
            \ ])

call quickui#menu#install('&Windows', [
            \ [ "&Resize window (+5)\t:vertical resize +5", 'vertical resize +5' ],
            \ [ "&Resize window (-5)\t:vertical resize -5", 'vertical resize -5' ],
            \ ])

call quickui#menu#install('&Terminal', [
            \ [ "&Terminal (Zsh Popup)\t<leader>sh", 'call feedkeys("\<space>sh")' ],
            \ [ "&Terminal (Built in)\t:terminal", 'terminal' ],
            \ ])

call quickui#menu#install('&Completer', [
            \ [ "&File completer\t:let chCompleter = 0", 'let chCompleter = 0' ],
            \ [ "&Tags completer\t:let chCompleter = 1", 'let chCompleter = 1' ],
            \ [ "&Included completer\t:let chCompleter = 2", 'let chCompleter = 2' ],
            \ ])

call quickui#menu#install('&Git', [
            \ [ "&add\t:Git add %:p", 'Git add %:p' ],
            \ [ "&status\t:Gstatus", 'Gstatus' ],
            \ [ "&commit file\t:Gcommit -v -q %:p", 'Gcommit -v -q %:p' ],
            \ [ "--", '' ],
            \ [ "&Push\t:Gpush", 'Gpush' ],
            \ ])

call quickui#menu#install('&VimTek + Header', [
            \ [ "&Set Epitech's Header\t:EpiHeader", 'EpiHeader' ],
            \ [ "&Force filetype=c + Header\t:set filetype=c | EpiHeader", 'set filetype=c | EpiHeader' ],
            \ [ "--", '' ],
            \ [ "Set vim-header\t:AddHeader", 'AddHeader' ],
            \ [ "--", '' ],
            \ [ "&Detect printf\t:set hlsearch /printf", 'call feedkeys(":set hlsearch\<CR>/printf\<CR>")' ],
            \ ])

call quickui#menu#install('&VimPlug', [
            \ [ "&Install\t:PlugInstall", 'PlugInstall' ],
            \ [ "&Clean\t:PlugClean", 'PlugClean' ],
            \ [ "--", '' ],
            \ [ "&Update\t:PlugUpdate", 'PlugUpdate' ],
            \ [ "&Upgrade\t:PlugUpgrade", 'PlugUpgrade' ],
            \ ])

call quickui#menu#install('Help (&?)', [
            \ ["&Index", 'call quickui#tools#display_help("index")', ''],
            \ ['&Tips', 'call quickui#tools#display_help("tips")', ''],
            \ ['&Completion', 'call quickui#tools#display_help("ins-completion")', ''],
            \ ['--', ''],
            \ ["&Tutorial", '!vimtutor', ''],
            \ ['&Quick Reference', 'call quickui#tools#display_help("quickref")', ''],
            \ ['&Summary', 'call quickui#tools#display_help("summary")', ''],
            \ ['--',''],
            \ ['&Vim Script', 'call quickui#tools#display_help("eval")', ''],
            \ ['&Current Word', 'call feedkeys("\"ayw:call quickui#tools#display_help("\<C-R>a")")' ],
            \ ], 10000)

let g:context_menu_k = [
            \ ["&Peek Definition", 'call quickui#tools#preview_tag("")'],
            \ ["--", '' ],
            \ ["&Indent file\tmagg=G`a", 'call feedkeys("magg=G`a")' ],
            \ ["&Trailing Spaces Remover\tCleanExtraSpaces", 'call CleanExtraSpaces() | echo "Rest in peace now"' ],
            \ ["--", '' ],
            \ ["&Highlight search\tset hlsearch", 'set hlsearch' ],
            \ ["&NoHighlight search\tset nohlsearch", 'set nohlsearch' ],
            \ ]

"nnoremap K "ayiw:call quickui#tools#display_help("<C-R>a")
"WIP Do not enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Notes (WIP)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"NerdCommenter is already setted Just letting comments for remembering
"<leader>cc Comment the selected lines
"<leader>cu Uncomment the selecte line
"<leader>cs Comment but for sexy code

"Characterize.Vim
"typing 'ga' in normal mode gives you the character value

"Vim multiple cursors
"    start: <C-n> start multicursor and add a virtual cursor + selection on the match
"    next: <C-n> add a new virtual cursor + selection on the next match
"    skip: <C-x> skip the next match
"    prev: <C-p> remove current virtual cursor + selection and go back on previous match
"select all: <A-n> start multicursor and directly select all matches

"Quickfix
"I only use a small subset of them:
":copen " Open the quickfix window
":ccl   " Close it
":cw    " Open it if there are 'errors', close it otherwise (some people prefer
"this)
":cn    " Go to the next error in the window
":cp    " Go to the previous error in the window
":cnf   " Go to the first error in the next file
":.cc   " Go to error under cursor (if cursor is in quickfix window)

"Tetris little game
"To start the game, press <Leader>te.
"(If you don't know what is <Leader>, you should press \te, and type :help
"Leader<Enter> to learn about what the heck leader is)
"Controls:
"h: left
"l: right
"j: down
"i,k: rotate
"<Space>: drop
"<Esc> or q: quit
"(if you have more or other keys, which help you to learn VIM, please send me
"the mail)
"p: pause game To restore, press <Leader>te in any window!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"LICENSE (Minimal reminder please check the real one)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
"FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
"OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
"PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
"EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
"WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
"ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
"YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
"NECESSARY SERVICING, REPAIR, OR CORRECTION.

"IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
"WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
"REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
"LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
"OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
"THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
"RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
"FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
"SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
"SUCH DAMAGES.

"Copyright (c) 2018 - 2020, Dalleau Mattis. All rights reserved.
