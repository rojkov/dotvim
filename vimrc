if &t_Co > 1
   syntax enable
endif

highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

highlight LineTooLong cterm=bold ctermbg=red guibg=LightYellow
autocmd ColorScheme * highlight LineTooLong cterm=bold ctermbg=red guibg=LightYellow
au BufWinEnter *.py let w:m2=matchadd('LineTooLong', '\%>80v.\+', -1)

au BufNewFile,BufRead *.mustache  setf mustache

" ignore case when searching
set ic

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
  filetype indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set smartcase		" Do smart case matching
"set autowrite		" Automatically save before commands like :next and :make

set modeline

" --------------------
" ShowMarks
" --------------------
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_enable = 1
" For marks a-z
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
" For marks A-Z
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
" For all other marks
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
" For multiple marks on the same line.
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen
