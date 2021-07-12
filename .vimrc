" Get the defaults that most users want.
" source $VIMRUNTIME/defaults.vim
"I used it. I used to it. Enough.


"by kostya

"Vundle Plugin
    set nocompatible
    filetype off

    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'
    "Plugins List
        Plugin 'scrooloose/nerdcommenter'
        Plugin 'scrooloose/nerdtree'
        Plugin 'ervandew/supertab'
        Plugin 'vim-latex/vim-latex'
        Plugin 'Valloric/YouCompleteMe'
        Plugin 'Yggdroot/indentLine'
        " Plugin 'python-mode/python-mode'

        Plugin 'tpope/vim-surround'
        Plugin 'tpope/vim-eunuch'
        Plugin 'editorconfig/editorconfig-vim'
        Plugin 'tpope/vim-fugitive'
        "Nice plugin but disturbs
        " Plugin 'itchyny/lightline.vim'

    call vundle#end()
    filetype plugin indent on

"vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif"
call plug#begin('~/.vim/plugged')
    Plug 'https://gitlab.com/code-stats/code-stats-vim.git'
call plug#end()

"Plugins
    "Indent line plugin
        let g:indentLine_char = '|'
        "Turn indentPlugin off i don't like extra symbols
            let g:indentLine_enabled = 0
    "EditorConfig
        let g:EditorConfig_exec_path = '/home/kostya/.editorconfig'
        let g:EditorConfig_max_line_indicator = "exceeding"
        "Ligthline coloscheme
        " let g:lightline = {
            " \ 'colorscheme': 'wombat',
            " \ }
    "Make empty .tex file .tex not .plaintex
        let g:tex_flavor='latex'
    "NERDTree
        nnoremap <F2> :NERDTreeToggle<CR>
        augroup NERDTree
            "Quit if NERDTree is the only page
                autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
        augroup END
    "YouCompleteMe
        let g:ycm_min_num_of_chars_for_completion = 2
        let g:ycm_max_num_candidates              = 10
        "Diagnostic
            let g:ycm_enable_diagnostic_signs         = 1
            let g:ycm_error_symbol                    = '>>'
            let g:ycm_warning_symbol                  = 'W'
            let g:ycm_enable_diagnostic_highlighting  = 1
            let g:ycm_echo_current_diagnostic         = 1
        let g:ycm_complete_in_comments = 0
        let g:ycm_complete_in_strings  = 1
        let g:ycm_collect_identifiers_from_comments_and_strings = 0
        let g:ycm_seed_identifiers_with_syntax = 1
        let g:ycm_autoclose_preview_window_after_completion = 1
        let g:ycm_autoclose_preview_window_after_insertion  = 1
        let g:ycm_key_list_select_completion                = ['<TAB>', '<Down>']
        let g:ycm_key_list_previous_completion              = ['<S-TAB>', '<Up>']
        let g:ycm_key_list_stop_completion                  = ['<C-y>']
        let g:ycm_key_invoke_completion                     = '<C-Space>'
        let g:ycm_key_detailed_diagnostics                  = '<leader>d'
        let g:ycm_confirm_extra_conf                        = 0
        let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
        map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
        "Stop YCM
        " let g:loaded_youcompleteme = 1
        "NerdCommenter
            let g:NERDSpaceDelims = 1
        "Syntastic
            set statusline+=%#warningmsg#
            set statusline+=%{SyntasticStatuslineFlag()}
            set statusline+=%*

            let g:syntastic_python_python_exec = 'python3'
            let g:syntastic_always_populate_loc_list = 1
            let g:syntastic_auto_loc_list = 1
            let g:syntastic_check_on_open = 1
            let g:syntastic_check_on_wq = 0
         "netrw
            let g:netrw_liststyle = 3 
            let g:netrw_banner = 0
            let g:netrw_browse_split = 3
            let g:netrw_winsize = 25

        "code-stats
            let g:codestats_api_key = 'SFMyNTY.YldGb2EyOXVjdz09IyNNVEV6TURNPQ.ztfXONswr1ceIlYlyZd3yGqvaQSpb-n9FknFaaGwgJY'

"General
    set nocompatible
    set ruler
    filetype on
    filetype plugin on
    filetype indent on
    set backspace   =indent,eol,start
    let mapleader   =","
    set exrc
    set secure
    "make find work recursively
    set path=$PWD/**

"Guioptions
    set guioptions-=T
    set guioptions-=m

"Special commands  make, grep, etc.
    set makeprg=make
    set grepprg=grep\ -n\ -P


"Backup
    set backup
    set backupext=.~
    "backupdir has problems with identically named files. Live with it
    set backupdir=$HOME/.vimbackup
    "SwapFile
        set swapfile
        set updatecount=100
        set updatetime=10000

"Tabs
    set switchbuf=usetab,newtab
    "<C-Left>, <C-Right> mapping to move between tabs
    set history     =1000
    set viminfo     ='1000,f1,:100,/100,h,%,!
    set undolevels  =5000

"Autocommands
    set autowrite
    augroup vimrc
    "Filetype
        autocmd FileType c,cpp set cindent
    "Delete trailing whitespaces and DOS-returns on write and file open
        " I am afraid it may add strange bugs
        " autocmd BufRead,BufWritePre,FileWritePre * silent! %s/[\r \t]\+$//
    augroup END

"Autocomplete. Plugin is better
    set dictionary=$HOME/.dictionary
    set complete=.,w,b,t,u,i,k

"Indentation
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set shiftround
    set listchars=tab:>=
    set list
    set showbreak=>>                             "Those symbols precede lines after break
    "C indentation
        "Look for FileType cindent in autocommands
    "I'm not sure
        set cinoptions=g0
        set cinwords=if,else,while,do,for,switch

"Format
    set formatoptions=qro

"Highlighting column. Ugly
    " set colorcolumn=110
    " highlight ColorColumn ctermbg=darkgray"


"Search
    set hlsearch
    set incsearch
    set ignorecase
    set infercase
    set smartcase
    set magic                                    "Yawp it is magic. And it improves regular expressions
    "Mathing
        set matchpairs=(:),{:},[:],<:>
        set showmatch
        set matchtime=5                          "Show matching for 0.5 seconds

"Russian commands
    set iskeyword=@,48-57,_,192-255
    set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

"Design
    "Text
        set guifont=Monospace\ 16
    "Colourscheme
        if has('gui_running')
            " GUI colors
            colorscheme DevC++
        else
            " Non-GUI (terminal) colors
            colorscheme wombat256mod
        endif
    "Numbers
        set number
    "Syntax
        syntax on
    "Size
"        if has("gui_running")
 "           set lines=999 columns=999            "Maximize gvim window. Causes shutdown on fedora
  "      endif

"Scroll
    set scrolloff=5
    set sidescrolloff=10

"Commandline
    set showcmd
    "But I don't use lightline plugin
        " set noshowmode "no need cause of lightline plugin
        " set laststatus=2
    set cmdheight=1
    set wildmenu
    set wildmode=longest:list,full
    set wildignore=*.o,*~
    set ttimeout                                 "timeout for key codes
    set ttimeoutlen=100                          "wait up to 100ms after Esc for special key

"NoSwp in Dropbox
autocmd BufNewFile,BufRead *
  \ if expand('%:~') =~ '^\~/Dropbox' |
  \   set noswapfile |
  \ else |
  \   set swapfile |
  \ endif

"Abbreviations

    " Help delete character if it is 'empty space'
    " stolen from Vim manual
    function! Eatchar()
    let c = nr2char(getchar())
    return (c =~ '\s') ? '' : c
    endfunction

    " Replace abbreviation if we're not in comment or other unwanted places
    " stolen from Luc Hermitte's excellent http://hermitte.free.fr/vim/
    function! MapNoContext(key, seq)
    let syn = synIDattr(synID(line('.'),col('.')-1,1),'name')
    if syn =~? 'comment\|string\|character\|doxygen'
        return a:key
    else
        exe 'return "' .
        \ substitute( a:seq, '\\<\(.\{-}\)\\>', '"."\\<\1>"."', 'g' ) . '"'
    endif
    endfunction

    " Create abbreviation suitable for MapNoContext
    function! Iab (ab, full)
    exe "iab <silent> <buffer> ".a:ab." <C-R>=MapNoContext('".
        \ a:ab."', '".escape (a:full.'<C-R>=Eatchar()<CR>', '<>\"').
        \"')<CR>"
    endfunction

    "I am not sure about those abbreviations
    "And it highlights a bracket :(

    call Iab('#d', '#define ')
    call Iab('#i', '#include <><Left>')
    call Iab('#I', '#include ""<Left>')
    " call Iab('if', 'if () {<CR><++><CR>}<Left><C-O>?)<CR>')
    " call Iab('while', 'while () {<CR><++><CR>}<C-O>?)<CR>')
    " call Iab('else', 'else {<CR>x;<CR>}<C-O>?x;<CR><Del><Del>')
    " call Iab('ifelse', 'if () {<CR><++><CR>}<CR>else {<CR><++><CR>}<C-O>?)<CR>')

"Mapping
    "Tabs navigating
        nnoremap  <C-Tab>   :tabnext<CR>
        nnoremap  <C-S-Tab> :tabprevious<CR>
    "Yanking and pasting from clipboard register
    "Works in gui-version only
        nnoremap  <C-P>     "+gP
        inoremap  <C-P>     <Esc>l"+gPi
        vnoremap  +         "+y
        vnoremap  <C-C>     "+y
        command   Out       :%y+
        nnoremap <leader>o  :%y+<Enter>
        nnoremap <leader>p  <Esc>"+gPi
    "Moving with arrows throuh long lines
        nnoremap <Down>     gj
        nnoremap <Up>       gk
    "Autocomplete using tab. Thanks to plugin. But I need Tab!
        inoremap <S-Tab>    <C-V><Tab>
    "Quick saving
        nnoremap <leader>w  :w<Enter>
    "Visual select. current paragraph
        nnoremap <leader>v  vip
    "No hl search!
        nnoremap <leader>n  :nohl<Enter> 
        "ACM style mappings
        "Standard compiling and answer printing. !changes current working directory!
        autocmd FileType cpp nnoremap <leader>a  :cd %:p:h<Enter> <bar> :!g++ -DLOCAL -std=c++17 -O3 -o ./%:r %:p && ./%:r && cat output.txt<Enter>
        autocmd FileType python nnoremap <leader>a :cd %:p:h<Enter> <bar> :! python3 ./% <Enter>

        nnoremap <leader>s  :cd %:p:h<Enter> <bar> :!g++ -DLOCAL -std=c++17 -O3 -o ./%:r %:p && ./%:r<Enter>
            nnoremap <leader>m  :make


"Tex files
    "Compiling
    nnoremap <leader>lt :!bash ~/.vim/scripts/r.sh "%"<Enter>

"The end

