
zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug "~/.zsh", from:local, use:"<->_*.zsh"

zplug "b4b4r07/enhancd", use:init.sh
if zplug check "b4b4r07/enhancd"; then
    export ENHANCD_FILTER="fzf --height 50% --reverse --ansi --preview 'ls -l {}' --preview-window down"
    #export ENHANCD_FILTER="fzf --height 50% --reverse --ansi"
    export ENHANCD_DOT_SHOW_FULLPATH=1
fi

zplug "b4b4r07/zsh-vimode-visual", use:"*.zsh", defer:3
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:"fzf", \
    frozen:1

# TODO: switch back to b4b4r07/zsh-history once
zplug 'kampka/zsh-history'
if zplug check 'kampka/zsh-history'; then
    export ZSH_HISTORY_FILE="$HOME/.zsh_history.db"
    export ZSH_HISTORY_FILTER="fzy -l 25"
    # History per directory
    export ZSH_HISTORY_KEYBIND_GET_BY_DIR="^r^d"
    # All histories
    export ZSH_HISTORY_KEYBIND_GET_ALL="^r"
    # Run any SQLs on original selector I/F (with screen)
    export ZSH_HISTORY_KEYBIND_SCREEN="^r^r"
    # substring
    export ZSH_HISTORY_KEYBIND_ARROW_UP="^p"
    export ZSH_HISTORY_KEYBIND_ARROW_DOWN="^n"
fi
