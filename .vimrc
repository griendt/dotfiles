" detect filetype detection, plugins, indentation
filetype plugin indent on

" allow syntax highlighting
syntax on

" hide abandoned buffers instead of unloading
set hidden

" allow backspacing over indents, eols and start of insert
set backspace=indent,eol,start

" set the color scheme
colorscheme desert

" enable automatic indentation with 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" highlight the current line
set cursorline

" show matching character (parantheses, etc.)
set showmatch

" search as characters are entered and highlight matches
set incsearch
set hlsearch

" set Ctrl+F to remove the search highlighting
nnoremap <C-F> :nohlsearch<CR>

" allow folding of code and let space open/close folds
set foldenable
nnoremap <Space> za

" enable status line always
set laststatus=2
highlight StatusLine ctermfg=0 ctermbg=2

" change the status line based on mode
if version >= 700
	au InsertEnter * hi StatusLine ctermfg=5 ctermbg=5 
	au InsertLeave * hi StatusLine ctermfg=5 ctermbg=5
endif

" create a function to tab-complete words
function! Tab_Or_Complete()
	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    	return "\<C-N>"
    else
   		return "\<Tab>"
	endif
endfunction

" map tab to perform auto-completion
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words"

" add git gutter highlights (set the colors)
highlight GitGutterAdd ctermbg=4 ctermfg=4
highlight GitGutterChange ctermbg=3 ctermfg=3
highlight GitGutterDelete ctermbg=1 ctermfg=1

" set git details in the statusline
"function! StatuslineGit()
"    let l:branchname = gitbranch#name()
"    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
"endfunction

" append the git branch to the statusline
"set statusline+=%{StatuslineGit()}

" allow j and k keys to move visually vertically
nnoremap j gj
nnoremap k gk

" automatically reload apache2 when Perl files are saved
autocmd BufWritePost *.pm !sudo service apache2 reload
autocmd BufWritePost *.pl !sudo service apache2 reload

" automatic auto-completion for PHP files
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

inoremap <C-@> <C-X><C-O>
"inoremap <C-@> <C-Space>
