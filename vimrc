if &t_Co > 1
   syntax enable
endif

set visualbell

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

set background=dark
colorscheme desert

let g:airline_symbols_ascii = 1

set foldlevelstart=11
" Some big Go files don't fit to the default maxmempattern(1000).
set maxmempattern=2000

" Disable edges when scrolling
set scrolloff=0

highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

highlight LineTooLong cterm=bold ctermbg=red guibg=LightYellow
autocmd ColorScheme * highlight LineTooLong cterm=bold ctermbg=red guibg=LightYellow
au BufWinEnter *.py let w:m2=matchadd('LineTooLong', '\%>80v.\+', -1)

" ignore case when searching
" set ic

" highlight search results
set hls
" use incremental search
set is

set ts=4
set shiftwidth=4
"set expandtab

set numberwidth=5
set number
:hi LineNr guibg=black
:hi LineNr ctermbg=black

" make buffers hidden rather than inactive
set hidden

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set autowrite		" Automatically save before commands like :next and :make
"set smartcase		" Do smart case matching

set modeline

" --------------------
" ShowMarks
" --------------------
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_enable = 1
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight entire line for lower marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 0
" For marks a-z
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue ctermbg=LightBlue ctermfg=Blue
" For marks A-Z
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed ctermfg=LightRed ctermbg=DarkRed
" For all other marks
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow ctermbg=LightYellow ctermfg=DarkYellow
" For multiple marks on the same line.
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen ctermbg=LightGreen ctermfg=DarkGreen

" Register ccls C++ lanuage server.
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {'cache': {'directory': '/home/rojkov/work/ccls-cache' }},
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

" quickfix key bindings
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" ---------------
"  VIM-GO
" ---------------
let g:go_fmt_command = "goimports"
"  Don't use location lists for Go
let g:go_list_type = "quickfix"
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "10s"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 0
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 0
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go set foldmethod=syntax
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" Close Preview window after complete.
autocmd CompleteDone * pclose

" ---------
"  tslime
"  --------

vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars
