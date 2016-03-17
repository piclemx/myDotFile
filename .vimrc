"****************************************************************************** 
" General settings
"****************************************************************************** 
syntax on
filetype plugin indent on

set cursorline
set cursorcolumn

map <c-j> 10j
map <c-k> 10k

imap jj <Esc>


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Enable pathogen to manage plugins
execute pathogen#infect()


" PHP settings
let php_htmlInStrings = 1  "Syntax highlight HTML code inside PHP strings.
let php_sql_query = 1      "Syntax highlight SQL code inside PHP strings.
let php_noShortTags = 1    "Disable PHP short tags.


" Easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
map <Leader>t <esc>:tabnew<CR>


" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Quicksave command
noremap <C-Z> :update<CR><Esc>
vnoremap <C-Z> <C-C>:update<CR><Esc>
inoremap <C-Z> <C-O>:update<CR><Esc>


" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Undo history
set undodir=~/.vim/undo_history/
set undofile
set undolevels=500 "maximum number of changes that can be undone
set undoreload=500 "maximum number lines to save for undo on a buffer reload


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


"****************************************************************************** 
" Plugin customization and quick keys
"****************************************************************************** 

" NERDTree
map <leader>f :NERDTreeToggle<CR>


" undotree
map <leader>h :GundoToggle<CR>


" Syntastic
let g:syntastic_check_on_open=0
let g:syntastic_mode_map = { 'mode': 'passive',
                            \ 'active_filetypes': [],
                            \ 'passive_filetypes': [] }


" vim-powerline
set laststatus=2 "Show powerline at startup
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" tagbar
map <Leader>p :TagbarToggle<CR>


" ultisnips
let g:UltiSnipsExpandTrigger="<leader>d"
let g:UltiSnipsJumpForwardTrigger="<leader>d"
"let g:UltiSnipsJumpBackwardTrigger="<leader>v>"
let g:UltiSnipsListSnippets="<c-a>"

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" neocomplcache
"let g:neocomplcache_enable_at_startup = 1
"
"imap <c-w>     <Plug>(neosnippet_expand_or_jump)
"smap <c-w>     <Plug>(neosnippet_expand_or_jump)
"xmap <c-w>     <Plug>(neosnippet_expand_target)
"
"imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
""imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<C-n>" : "\<TAB>"
"
""imap <expr><CR> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<CR>"
"smap <expr><CR> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<CR>"

" For snippet_complete marker.
"if has('conceal')
"    set conceallevel=2 concealcursor=i
"endif
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

call pathogen#infect()

let g:instant_markdown_slow = 1
let g:textutil_txt_encoding='Shift_JIS'

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
