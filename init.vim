if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd VimEnter *
  \ if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  \ | PlugInstall | q
  \ | endif

call plug#begin('$HOME/.config/nvim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'sheerun/vim-polyglot'
    Plug 'Yggdroot/indentLine'
    Plug 'pangloss/vim-javascript'
    Plug 'pseewald/vim-anyfold'
    Plug 'jiangmiao/auto-pairs'
    Plug 'toupeira/vim-desertink'
    Plug 'maralla/completor.vim'
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
    Plug 'dense-analysis/ale'

    " my plugs
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'ap/vim-css-color'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'elixir-editors/vim-elixir'
    Plug 'ryanoasis/vim-devicons'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    
    " themes
    Plug 'ayu-theme/ayu-vim'
    Plug 'joshdick/onedark.vim'
    Plug 'dracula/vim'
call plug#end()

"let g:deoplete#enable_at_startup = 1

set termguicolors     " enable true colors support

"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme

colorscheme dracula

let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

set softtabstop=2
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
filetype plugin indent on
set number
set autoindent
set cindent
set smartindent
set encoding=utf-8
set iskeyword+=\-
set splitright
set history=300
set undolevels=300
set incsearch
set ignorecase
set hlsearch
set scrolloff=5
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set wrap
set mouse=a
filetype plugin on
syntax on
set foldlevel=2
set statusline+=%F
set laststatus=2
set splitbelow
set nowrap

" SYNTASTIC
" Syntastic is a syntax checking plugin for Vim that runs files through
" external syntax checkers and displays any resulting errors to the user.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"----------------------------------------------"
"---------CONFIGURAÇÕES DE PLUGINS-------------"
"----------------------------------------------"
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

let g:javascript_plugin_flow = 1
let g:user_emmet_leader_key=','
let g:indentLine_char = '│'

let g:ale_linters = {
\   'javascript': ['standard'],
\   'python': ['pylint']
\}

let g:completor_python_binary = '/usr/bin/python3'

let g:indentLine_color_term = 239

"autocmd FileType help,nerdtree IndentLinesToggle

" NERDTree
nnoremap <leader>ft :NERDTreeToggle<cr>
set ts=4
set cul
syn match ipaddr   /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
 hi link ipaddr Identifier
 imap ><Tab> ><Esc>mt?<\w<Cr>:let @/=""<Cr>lyiw`ta</><Esc>P`tli

nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" Ativa fechamento automático para parêntese
" Set automatic expansion of parenthesis/brackets
inoremap ( ()<esc>:call BC_AddChar(")")<cr>i
inoremap { {}<esc>:call BC_AddChar("}")<cr>i
inoremap [ []<esc>:call BC_AddChar("]")<cr>i
" inoremap " ""<esc>:call BC_AddChar(""")<cr>i

"----------------------------------------------"
"---------CONFIGURAÇÕES PESSOAIS---------------"
"----------------------------------------------"

inoremap <C-f>  <C-x><C-o>
inoremap ;; <Esc>
inoremap <C-s> <C-\><C-o>:w<CR>
tnoremap <Esc> <C-\><C-n>
inoremap <C-x><C-x> <Esc>:wq! <CR>
nnoremap <C-t> :sp+terminal<CR>
nnoremap z za
nnoremap n gt
vnoremap <F9> :sort<CR>
vnoremap < <gv
vnoremap > >gv
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q
ca w!! w !sudo tee "%"

function! Executar(arq)
  :w
  if &filetype == 'javascript.jsx'
    :exec '!time node' a:arq
  elseif &filetype == 'javascript'
    :exec '!time node' a:arq
  elseif &filetype == 'java'
    :exec "!javac %"
    :exec "!time java -cp %:p:h %:t:r"
  elseif &filetype == 'python'
    :exec "!time python3" a:arq
  elseif &filetype == 'ruby'
    :exec "!time ruby" a:arq
  elseif &filetype == 'html'
    :exec "!live-server %:p:h"
  elseif &filetype == 'racket'
    :exec "!racket" a:arq
  elseif &filetype == 'c'
    :exec "!time clang % && ./a.out %% rm -rf ./a.out"
  elseif &filetype == 'sh'
    :exec '!time bash' a:arq
  elseif &filetype == 'php'
    :exec '!time php' a:arq
  elseif &filetype == 'lua'
    :exec '!time lua' a:arq
  else
    :exec "!live-server %:p:h"
  endif
endfunction
inoremap <C-n> <Esc>:call Executar(shellescape(@%, 1))<CR>
nnoremap <F5> :call Executar(shellescape(@%, 1))<CR>

autocmd Filetype * AnyFoldActivate

if (has("termguicolors"))
 set termguicolors
endif

let mapleader = ","

autocmd BufEnter *.{js,jsx,ts,tsx,html} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx,html} :syntax sync clear

augroup omni_complete
    autocmd!
    autocmd FileType css,scss,sass setlocal omnifunc=csscomplete#CompleteCSS
augroup END
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

hi Normal guibg=#17181fp
