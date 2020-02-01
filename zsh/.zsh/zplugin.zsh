zplugin load "zsh-users/zsh-completions"
zplugin load "zsh-users/zsh-syntax-highlighting"

zplugin load "denysdovhan/spaceship-prompt"

zplugin snippet ~/.zsh/10_utils_git.zsh
zplugin snippet ~/.zsh/25_direnv.zsh
zplugin snippet ~/.zsh/25_gpg.zsh
zplugin snippet ~/.zsh/30_aliases.zsh
zplugin snippet ~/.zsh/50_prompt.zsh
zplugin snippet ~/.zsh/60_history.zsh

zplugin ice silent wait pick"init.sh"
zplugin load "b4b4r07/enhancd"
export ENHANCD_FILTER="fzf --height 50% --reverse --ansi --preview 'ls -l {}' --preview-window down"
export ENHANCD_DOT_SHOW_FULLPATH=1

zplugin ice silent wait pick"nix-shell.plugin.zsh"
zplugin load "chisui/zsh-nix-shell"

