" For a paranoia.
" Normally `:set nocp` is not needed, because it is done automatically
" when .vimrc is found.
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

if exists('*minpac#init')
  " minpac is loaded.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
  call minpac#add('altercation/vim-colors-solarized')
  call minpac#add('tpope/vim-fugitive')
  " call minpac#add('vim-jp/syntax-vim-ex')
  call minpac#add('vim-airline/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')
  call minpac#add('scrooloose/nerdtree')
  call minpac#add('bling/vim-bufferline')

  " FZF / Ctrlp for file navigation
  if executable('fzf')
    call minpac#add('junegunn/fzf')
    call minpac#add('junegunn/fzf.vim')
  else
    call minpac#add('ctrlpvim/ctrlp.vim')
  endif

  " Language specific plugins
  " Nix / NixOS
  call minpac#add('LnL7/vim-nix')
  " Zig / Ziglang
  call minpac#add('ziglang/zig.vim')
endif

" Plugin settings here.

let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
