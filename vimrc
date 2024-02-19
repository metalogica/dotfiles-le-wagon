syntax on
set backspace=indent,eol,start
set tabstop=2 shiftwidth=2 expandtab
if has("multi_byte")
  set encoding=utf-8
  setglobal fileencoding=utf-8
else
  echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif
" define <leader> as `,`
let mapleader = ","

" swap file error
if empty(glob('~/.vim/tmp'))
    silent !mkdir -p ~/.vim/tmp
endif
set directory=$HOME/.vim/tmp

" themes
:colorscheme nordfox

" terminal
"" setup path
:source "${HOME}/.aliases"

" macros
"" open all IDE config files
:let @c=":tabnew ~/.zshrc\<CR>:tabnew ~/.aliases\<CR>:tabnew ~/.config/shakepay/aliases\<CR>:tabnew ~/.vimrc\<CR>:tabclose 1\<CR>:tabnew ~/.config/nvim/init.vim\<CR>:tabnew ~/.p10k.zsh\<CR>"

" File brwoser (telescope)
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" defaults 
:set number
:set mouse=a

" clipboard
:xnoremap <C-c> :w !pbcopy<CR>

" vim split
set splitbelow
set splitright
"" move to left - right tabs
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
" move to uo - down tabs
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

" system
"" track file changes in buffer
:set autoread
"" reload file. :so == :source
:nnoremap <D-r> :so %<CR>
"" reload VIM config (<leader> == spacebar)
:nnoremap <silent> <Space><Space> :source $MYVIMRC<CR>
  
" file control test
"" save file
:nnoremap <c-s> :update<CR>
"" close and save file 
"" close and dont save file

" Basic Text
"" insert line break
nnoremap <S-b> o<ESC>k

" tabs
:nnoremap <C-n> :tabnew<CR>
"" cycle through tabs
:nnoremap <S-Tab> :tabn<CR>

" navigation
:inoremap jk <esc>
:xnoremap jk <esc>

" code manipulation
"" move lines up
:nnoremap <C-k> :<C-u>m-2<CR>==
:xnoremap <C-k> :m-2<CR>gv=gv
"" move lines down
:nnoremap <C-j> :<C-u>m+<CR>==
:xnoremap <C-j> :m'>+<CR>gv=gv

" syntax
"" create new pair of \"\" and place cursor in-between them
:nnoremap "" i""<ESC>i

" code commenting
"" insert // at beginning of line
:xnoremap <C-_> :'<,'>normal I// <CR>

" code completion
"" emmet
:inoremap <TAB> <C-y>
