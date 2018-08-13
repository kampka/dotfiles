
# Setup 256color terminal
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color


# Return if zsh is called from Vim
if [[ -n $VIMRUNTIME ]]; then
    return 0
fi

# auto-install zplug
if [[ ! -d ~/.zplug ]]; then
    echo '[zshrc] installing zplug...'
    git clone https://github.com/zplug/zplug ~/.zplug
fi

if [[ -f ~/.zplug/init.zsh ]]; then
    export ZPLUG_LOADFILE=~/.zsh/zplug.zsh
    
    source ~/.zplug/init.zsh

    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
        echo
    fi
    zplug load
fi
