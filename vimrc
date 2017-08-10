set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on

set encoding=utf8

set wrap nowrap
set hlsearch

set listchars=tab:>-,space:·
set list

"set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
"set expandtab

set background=dark

filetype plugin indent on
filetype on

set number lines

" General keybindings
imap <C-o> <esc>O

let g:tex_flavor='latex'

" YCM
let g:ycm_confirm_extra_conf = 0

" YCM (keybindings)
map <F12> :!./compile<CR>
"map <C-F12> :YcmCompleter GoToDeclaration<CR>
"map <F12> :YcmCompleter GoToDefinition<CR>
"map <C-j> :YcmCompleter GetType<CR>

"clang_complete
" let g:clang_auto_user_options='.clang_complete'
" let g:clang_library_path='/usr/lib/llvm/'
" let g:clang_complete_copen=1
" let g:clang_use_library=1
" let g:clang_hl_errors=1
" set completeopt=menu,menuone,longest
" set pumheight=15


"set tags+=~/.vim/tags/cpp
"map <F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"OmniCppComplete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview

"Spell checker
"set spell spelllang=en_us
