" Function to source only if file exists {
function! SourceIfExists(file)
	if filereadable(expand(a:file))
		exe 'source' a:file
	endif
endfunction
" }

" Use this function to switch to a writeable buffers
function! SwitchToWriteableBuffer()
    let c = 0
    let wincount = winnr('$')
    " Don't open it here if current buffer is not writable (e.g. NERDTree)
    while !empty(getbufvar(+expand("<abuf>"), "&buftype")) && c < wincount
        exec 'wincmd w'
        let c = c + 1
    endwhile
endfunction
"
" Use this function to prevent fzf/CtrlP opening files inside non-writeable buffers, e.g. NERDTree
function! SwitchToWriteableBufferAndExec(command)
    call SwitchToWriteableBuffer()
    exec a:command
endfunction

" Load the minpac plugin manager

call SourceIfExists($HOME . "/.config/nvim/minpac.vim")
call SourceIfExists($HOME . "/.config/nvim/vimwiki.vim")

if(isdirectory(expand($HOME . "/.config/nvim/pack/minpac/start/vim-colors-solarized")))
    set background=dark
    " set background=light
    colorscheme solarized
endif


function! s:EnsureDirectory(path, ...)
  let mode = get(a:, 1, 0700)
  let exp = expand(a:path)
  if !isdirectory(exp)
    call mkdir(exp, "p", mode)
  endif
  return exp
endfunction

function! s:SetupStateDirs()

  " Create vim state dir
  let l:vimStateDir = s:EnsureDirectory($HOME."/.local/share/nvim")
  
  " Use undo file to store persistent undo informatioon
  let &undodir = s:EnsureDirectory(l:vimStateDir."/undo")
  set undodir?
  set undofile
  
  " Store backup files in vim state dir
  let &backupdir = s:EnsureDirectory(l:vimStateDir."/backup")
  set backupdir?
  
endfunction
autocmd vimenter * call s:SetupStateDirs()

" Set split separator to Unicode box drawing character
set encoding=utf8
set fillchars=vert:│
" Ensure the colorscheme does not impose backround color setting for vertical
" split seperators. Otherwise, bg == fg might just fill the whole cell uniform
autocmd VimEnter,ColorScheme * highlight VertSplit cterm=NONE ctermbg=NONE

" Remap the leader key to ,
:let mapleader = ","

" Ripgrep for file indexing, sort of faster, but not really, but also why not
" use ripgrep for everything
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages "" .'
endif

" Use FZF for files and tags if available, otherwise fall back onto CtrlP
" <leader>j will search for tag using word under cursor
let g:fzf_command_prefix = 'Fzf'
if executable('fzf')
  nnoremap <leader>v :call SwitchToWriteableBufferAndExec('FzfFiles')<CR>
  nnoremap <leader>u :call SwitchToWriteableBufferAndExec('FzfTags')<CR>
  nnoremap <leader>j :call fzf#vim#tags("'".expand('<cword>'))<cr>
else
  nnoremap <leader>v :call SwitchToWriteableBufferAndExec('CtrlP')<CR>
endif

" NERDtree

" Start NERDTree on VimEnter
function! StartNerdTree()
  "Omit starting NERDTree on vimwiki projekts
  if &ft =~ 'vimwiki'
    return
  endif
  " Start NERDTree
  NERDTree
  " Switch to the NERDTree buffer
  wincmd w
  " Sync the buffer to the current active file
  call SyncNerdTree()
endfunction

" Sync NERDTree to current file, meaning navigate to open buffer if buffer is
" writable
function! SyncNerdTree()
  " Don't show NERDTree when using vimwiki
  let isNerdTreeOpen = exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
  if &modifiable && isNerdTreeOpen && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Toggle NERDtree on/off on F5
nnoremap <f5> :NERDTreeToggle <CR>
" Open NERDtree when vim is started
autocmd VimEnter * call StartNerdTree()
" Close NERDtree if all other buffers are closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Re-sync the NERDTree buffer when a new file is opened
autocmd BufEnter * call SyncNerdTree()

"" BEGIN VimWiki configuration
"  let s:vim_wiki_state_dir = s:EnsureDirectory($HOME."/.local/share/vimwiki")
"
"  let s:personal_wiki = {}
"  let s:personal_wiki.path = s:vim_wiki_state_dir.'/personal/'
"
"  let g:vimwiki_list = [ s:personal_wiki ]
"
"" END VimWiki configuration

set ts=4 sts=4 sw=4 expandtab
