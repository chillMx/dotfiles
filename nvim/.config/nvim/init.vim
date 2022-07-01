" Plugins
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'https://github.com/derekwyatt/vim-fswitch.git'
Plug 'https://github.com/ludovicchabant/vim-gutentags.git'
Plug 'https://github.com/liuchengxu/vista.vim.git'
Plug 'itchyny/lightline.vim'
Plug 'mfussenegger/nvim-dap'
Plug 'https://github.com/rhysd/vim-clang-format.git'
Plug 'https://github.com/bfrg/vim-cpp-modern.git'
call plug#end()

" Enable relative numbers and 80 character guide line
set rnu
set colorcolumn=80

" Enable lightline
set laststatus=2

" Switch lightline color scheme
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }

" Configure lightline
if !has('gui_running')
	set t_Co=256
endif

" Show function in lightline bar
function! LightlineCurrentFunctionVista() abort
  let l:method = get(b:, 'vista_nearest_method_or_function', '')
  if l:method != ''
    let l:method = '[' . l:method . ']'
  endif
  return l:method
endfunction
au VimEnter * call vista#RunForNearestMethodOrFunction()

" Disable regular status bar
set noshowmode

" Assign <leader> key to spacebar
let mapleader = " "

" Assign <localleader> key to comma
let maplocalleader = ","

" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

" Remove trailing whitespaces
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Allow K to pull up manual for C++ standard library
function! s:JbzCppMan()
	let old_isk = &iskeyword
	setl iskeyword+=:
	let str = expand("<cword>")
	let &l:iskeyword = old_isk
	execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()

" Binds K to use function previously defined
au FileType cpp nnoremap <buffer>K :JbzCppMan<CR>

" Use vim-fswitch to switch between source and header
au BufEnter *.h  let b:fswitchdst = "c,cpp,cc,m"
au BufEnter *.cc let b:fswitchdst = "h,hpp"
au BufEnter *.h let b:fswitchdst = 'c,cpp,m,cc' | let b:fswitchlocs = 'reg:|include.*|src/**|'

" Assign keybindings to switch between source and header
nnoremap <silent> <A-o> :FSHere<cr>

" Extra hotkeys to open header/source in the split
nnoremap <silent> <localleader>oh :FSSplitLeft<cr>
nnoremap <silent> <localleader>oj :FSSplitBelow<cr>
nnoremap <silent> <localleader>ok :FSSplitAbove<cr>
nnoremap <silent> <localleader>ol :FSSplitRight<cr>

"Automatically assigns ctags
set tags=./tags;
let g:gutentags_ctags_exclude_wildignore = 1
let g:gutentags_ctags_exclude = [
	\'node_modules', '_build', 'build', 'CMakeFiles', '.mypy_cache', 'venv',
	\'*.md', '*.tex', '*.css', '*.html', '*.json', '*.xml', '*.xmls', '*.ui']

" Enable vista split to browse ctags
nnoremap <silent> <A-6> :Vista!!<CR>

" Select Google C++ Style Guide/edit style (doesn't seem to work but should default to
" google)
let g:clang_format#style_options = {
	\ "BreakBeforeBraces" : "Allman"}

" Add keybinds for formatting using vim-clang-format
au FileType c,cpp nnoremap <buffer><leader>lf :<C-u>ClangFormat<CR>
au FileType c,cpp vnoremap <buffer><leader>lf :ClangFormat<CR>


