if (( $+commands[bat] )); then
  alias cat="bat -p --paging=never"
fi

if (($+commands[nvim] )); then
  alias wiki="nvim -c ':packadd vimwiki | VimwikiIndex'"
fi
