" Function to source only if file exists {
function! SourceIfExists(file)
	if filereadable(expand(a:file))
		exe 'source' a:file
	endif
endfunction
" }

" Load the minpac plugin manager

call SourceIfExists("minpac.vim")

set ts=4 sts=4 sw=4 expandtab
