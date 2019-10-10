
# Setup 256color terminal
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

# Return if zsh is called from Vim
if [[ -n $VIMRUNTIME ]]; then
    return 0
fi

# auto-install zplugin
if [[ ! -d ~/.zplugin ]]; then
    echo '[zshrc] installing zplugin ...'
    mkdir ~/.zplugin
    git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin
fi

if [[ -f ~/.zplugin/bin/zplugin.zsh ]]; then
    source ~/.zplugin/bin/zplugin.zsh

    if ! find ~/.zplugin/bin/zplugin.zsh.zwc -mtime +7 > /dev/null; then
        zplugin self-update
    fi

    autoload -Uz _zplugin
    (( ${+_comps} )) && _comps[zplugin]=_zplugin

    source ~/.zsh/zplugin.zsh
fi

