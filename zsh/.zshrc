# Setup 256color terminal
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

# Return if zsh is called from Vim
if [[ -n $VIMRUNTIME ]]; then
    return 0
fi

# auto-install zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d ${ZINIT_HOME} ]]; then
    echo '[zshrc] installing zinit ...'
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi


if [[ -f ${ZINIT_HOME}/zinit.zsh ]]; then
    source ${ZINIT_HOME}/zinit.zsh

    if ! find ${ZINIT_HOME}/zinit.zsh.zwc -mtime +7 > /dev/null; then
        zinit self-update
    fi

    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit

    # Initialize our own setup from dotfiles
    source ${HOME}/.zsh/zinit.zsh
fi

