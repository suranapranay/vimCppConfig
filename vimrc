" VIM Configuration File for CPP
" Author: Pranat Surana
" set UTF-8 encoding

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" turn syntax highlighting on
set t_Co=256
syntax on
" colorscheme wombat256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
" Enhanced keyboard mappings
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>
" in diff mode we use the spell check keys for merging
if &diff
” diff settings
map <M-Down> ]c
map <M-Up> [c
map <M-Left> do
map <M-Right> dp
map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
" spell settings
:setlocal spell spelllang=en
" set the spellfile - folders must exist
set spellfile=~/.vim/spellfile.add
map <M-Down> ]s
map <M-Up> [s
endif
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle configurations " 
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'Buffergator'

Plugin 'rdnetto/YCM-Generator'

Plugin 'ctrlp.vim' 

Plugin 'git://git.wincent.com/command-t.git'

Plugin 'morhetz/gruvbox'

Plugin 'honza/vim-snippets'

Plugin 'SirVer/ultisnips'

Plugin 'scrooloose/nerdtree'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

"Plugin 'Valloric/YouCompleteMe'"
call vundle#end() 

filetype plugin indent on

" end vundle configurations " 

let g:UltiSnipsExpandTrigger="<ctrl-[>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
colorscheme gruvbox
set background=dark
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<C-e>'],
    \ 'AcceptSelection("t")': ['<Cr>'], }

let g:ctrlp_user_command = 'find %s -type f'

let g:ctrlp_max_files = 0


nnoremap <Leader>f :Files<CR>

