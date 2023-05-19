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

if (($+commands[idea-community])); then
  alias idea="idea-community . &>/dev/null &"
fi

if (($+commands[glab])); then
  alias mrc="glab mr create -f -y | tee $(tty) | grep -o -E \"https://gitlab.com/.+/merge_requests/[0-9]+$\" | wl-copy"
fi
