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

set ts=4 sts=4 sw=4 expandtab
