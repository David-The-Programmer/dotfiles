" Turning on the line numbers on the side
set number

" Setting on the line numbers on the side to be relative
set relativenumber

" Limit size of tab to be 4 for proper indentation
set tabstop=4
set shiftwidth=4
set expandtab

" Remap for shifting between tabs
nnoremap Q gT
nnoremap W gt

" Set the leader key to space
let mapleader = " "

" -----------------------------------------------------------------------
" PLUGINS SECTION
" Install and run vim-plug on first run
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Example
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-plug'

" Get the vim code dark theme
Plug 'tomasiser/vim-code-dark'

" Plugin for vim surround
Plug 'tpope/vim-surround'

" Plugin for replace with register
Plug 'vim-scripts/ReplaceWithRegister'

" Plugin for camel case motion
Plug 'bkad/CamelCaseMotion'

" Plugin for fzf (fuzzy finder) in vim
" Remember to git clone fzf and install as stated on README
Plug 'junegunn/fzf', { 'do':  { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plugin for commenting with ctrl /
Plug 'preservim/nerdcommenter'

" Plugin for vim-airline
Plug 'vim-airline/vim-airline'

" Initialize plugin system
call plug#end()
" After that, Reload .vimrc and :PlugInstall to install plugins.
" -----------------------------------------------------------------------
" PLUGINS CONFIG

" Config for CamelCaseMotion
" Set the camel case motion key
let g:camelcasemotion_key = '<leader>'


" Config for FZF plugin
" Remap for :Files command to be ctrl f
nnoremap <silent> <C-f> :Files<CR>


" Config for NERD Commenter plugin
filetype plugin on

" Invoke comments by pressing ctrl /
vmap <C-_> <plug>NERDCommenterToggle
nmap <C-_> <plug>NERDCommenterToggle

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1


" Config for the vim airline plugin
" Need this for airline status bar to display properly
let g:airline_powerline_fonts = 1

" Code dark theme for vim airline plugin
let g:airline_theme = 'codedark'

" Show tab details in tab line
let g:airline#extensions#tabline#enabled = 1

" Do not show buffers
let g:airline#extensions#tabline#show_buffers = 0

" Show tabs instead of buffers
let g:airline#extensions#tabline#show_tabs = 1

" Stop displaying tab number
let g:airline#extensions#tabline#show_tab_nr = 0

" Prevents tab from displaying on the right
let g:airline#extensions#tabline#show_splits = 0

" Stop displaying the close button
let g:airline#extensions#tabline#show_close_button = 0

" Config for how file paths are displayed on tabs
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Show number of matches of search
set shortmess-=S

" No need to show current mode
set noshowmode


" -----------------------------------------------------------------------
" THEME SECTION
syntax enable

if (has("termguicolors"))
	set termguicolors
endif

colorscheme codedark
" -----------------------------------------------------------------------
