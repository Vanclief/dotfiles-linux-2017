"| |  / /   |  / | / / ____/ /   /  _/ ____/ ____/
"| | / / /| | /  |/ / /   / /    / // __/ / /_
"| |/ / ___ |/ /|  / /___/ /____/ // /___/ __/
"|___/_/  |_/_/ |_/\____/_____/___/_____/_/
"
" repo  : https://github.com/vanclief/dotfiles/
" file  : vimrc


if has('nvim')
  " Neovim specific commands

else
  " Standard vim specific commands

endif

" General commands

scriptencoding utf-8
set encoding=utf-8

" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set ignorecase
set smartcase

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'
  "
  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
  " bind K to grep word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
endif

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Run python
nnoremap <Leader>rp :call Send_to_Tmux("python ".expand('%:p')."\n")<cr>
map <Leader>tl :call Send_to_Tmux(getline('.')."\n")<cr>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
      \ {"regex": "possibly useless use of a variable in void context"}
" let g:tsuquyomi_disable_quickfix = 1
" let g:tsuquyomi_completion_detail = 1

" Typescript linter
" let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

" Python linter
let g:syntastic_python_checkers = ['flake8']

" JS linter
let g:syntastic_javascript_checkers = ['standard']

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" ===============================================================================
" Settings stolen from a Dutch guy
" ===============================================================================
imap jj <ESC>
imap jk <ESC>
set relativenumber

"color Tomorrow-Night-Bright
set lazyredraw
set complete-=i

set background=dark
syntax enable
let g:solarized_termcolors = 16
let g:solarized_termtrans = 1
colorscheme solarized

" Don't wait so long for the next keypress (particularly in ambigious Leader
" situations.
set timeoutlen=500

" Setup rspec vim
" let g:rspec_command = 'call Send_to_Tmux("bin/rspec {spec}\n")'
let test#strategy = 'tslime'

" SendToTmux should always use current session
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

" Remove trailing whitespace on save for ruby files.
au BufWritePre *.rb :%s/\s\+$//e
au BufWritePre *.haml :%s/\s\+$//e
au BufWritePre *.yml :%s/\s\+$//e
au BufWritePre *.js :%s/\s\+$//e
au BufWritePre *.coffee :%s/\s\+$//e
au BufWritePre *.ts :%s/\s\+$//e
au BufWritePre *.py :%s/\s\+$//e

" ===============================================================================
" Tweaks
" ===============================================================================

" No need for ex mode 
nnoremap Q <nop>

let g:airline_theme='solarized'

hi SpellBad cterm=underline ctermfg=red

" ==============================================================================
" KEYMAPPINGS
" ==============================================================================

" jump to beginning of file with 0
nmap 0 ^

" quick write
map <Leader>w <ESC>:w<cr>l

" open and source vim config and bundles
nmap <Leader>vi :sp $MYVIMRC<cr>
nmap <Leader>vso :source $MYVIMRC<cr>
nmap <Leader>vb :sp $HOME/.vimrc.bundles<cr>

" open i3 config
nmap <Leader>3i :sp $HOME/.i3/config<cr>

" open file browser for directory current file is in
nmap <Leader>d :lefta 30vsp %:p:h<cr>

" indent entire file
nmap <Leader>i mmgg=G`m<cr>

nmap <Leader>gr :Qfdo %s/find/replace/g

map <Leader>mi :!bin/rake db:migrate<cr>

" Tmux related
map <Leader>tl :call Send_to_Tmux(getline('.')."\n")<cr>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>ed :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>sd :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>vd :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

map <Leader>q <ESC>:q!<CR>
map <Leader>gs <ESC>:Gstatus<CR>
map <Leader>gr <ESC>:Gread<CR>

" Remap ; to :, because you never use :
nnoremap ; :

" --------------------------------------------------
" copy and paste from clipboard
" --------------------------------------------------

set clipboard=unnamedplus

" selections
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p
set pastetoggle=<F2>
nnoremap <Leader>P "+P

" entire file
nnoremap <Leader>fy :%y+<cr>

" Run rubocop (with and without auto-correct)
nnoremap <Leader>ru :silent Dispatch rubocop -R %<cr>
nnoremap <Leader>ra :silent exec "!rubocop -R --auto-correct %"<cr>:redraw!<cr>

" open fzf in ctrlp style
nnoremap <C-p> :Files<CR><C-w>=

