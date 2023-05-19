
if (( $+commands[gpgconf] )); then
  if [ -S "$(gpgconf --list-dirs agent-socket)" ]; then
    export GPG_TTY=$(tty)
    gpg-connect-agent --quiet updatestartuptty /bye > /dev/null
  fi

  if [ -S "$(gpgconf --list-dirs agent-ssh-socket)" ]; then
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  fi
fi
