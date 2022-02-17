if (( $+commands[bat] )); then
  export BAT_THEME="Nord"
  alias cat="bat -p --paging=never"
fi

if (($+commands[nvim] )); then
  alias wiki="nvim -c ':packadd vimwiki | VimwikiIndex'"
  alias v="nvim"
fi

if (($+commands[exa] )); then
  alias ll="exa -lh --git --all --octal-permissions"
  alias l="exa -lh --git --all --octal-permissions"
fi

if (($+commands[trash-put])); then
  alias tp="trash-put"
  alias rm="echo 'Use trash-put / tp to remove files or directories.'; false"
fi
