" Function to source only if file exists {
function! SourceIfExists(file)
	if filereadable(expand(a:file))
		exe 'source' a:file
	endif
endfunction
" }

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
  nnoremap <leader>v :FzfFiles<cr>
  nnoremap <leader>u :FzfTags<cr>
  nnoremap <leader>j :call fzf#vim#tags("'".expand('<cword>'))<cr>
else
  nnoremap <leader>v :CtrlP<Space><cr>
endif

set ts=4 sts=4 sw=4 expandtab
