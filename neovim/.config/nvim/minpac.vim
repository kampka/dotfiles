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
  call minpac#add('arcticicestudio/nord-vim')
  " call minpac#add('altercation/vim-colors-solarized')

  call minpac#add('itchyny/lightline.vim')
  " call minpac#add('vim-airline/vim-airline')
  " call minpac#add('vim-airline/vim-airline-themes')

  call minpac#add('tpope/vim-fugitive')
  
  " call minpac#add('vim-jp/syntax-vim-ex')
  call minpac#add('scrooloose/nerdtree')
  " call minpac#add('bling/vim-bufferline')
  call minpac#add('mengelbrecht/lightline-bufferline')
  call minpac#add('mbbill/undotree')

  " Denite is a generic fuzzy finder with more sources that fzf
  call minpac#add('Shougo/denite.nvim')
  " Deoplete auto completion plugin
  call minpac#add('Shougo/deoplete.nvim')

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
  " VimWiki
  call minpac#add('vimwiki/vimwiki', {'type': 'opt'})
  
  " Terraform
  call minpac#add('hashivim/vim-terraform')

  " TypeScript
  call minpac#add('HerringtonDarkholme/yats.vim') " Syntax highlighting

endif

" Plugin settings here.

colorscheme nord

" Lightline
set showtabline=2
let g:lightline                  = { 'colorscheme': 'nord' }
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" let g:airline_solarized_bg='dark'
" let g:airline_powerline_fonts = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

" Terraform settings
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Undotree
nnoremap <C-U> :UndotreeToggle <CR>
let g:undotree_WindowLayout = 4
let g:undotree_HighlightChangedWithSign = 0
let g:undotree_SplitWidth = 50
let g:undotree_DiffpanelHeight = 15

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
