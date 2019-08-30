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

if(isdirectory(expand($HOME . "/.config/nvim/pack/minpac/start/vim-colors-solarized")))
    set background=dark
    " set background=light
    colorscheme solarized
endif

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
" Toggle NERDtree on/off on F5
nnoremap <f5> :NERDTreeToggle <CR>
" Open NERDtree when vim is started
autocmd vimenter * NERDTree | wincmd w | call SyncNerdTree()
" Close NERDtree if all other buffers are closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Sync NERDTree to current file, meaning navigate to open buffer if buffer is
" writable
function! SyncNerdTree()
  let isNerdTreeOpen = exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
  if &modifiable && isNerdTreeOpen && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

autocmd BufEnter * call SyncNerdTree()

set ts=4 sts=4 sw=4 expandtab
