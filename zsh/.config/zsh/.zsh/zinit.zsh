zinit load "zsh-users/zsh-completions"
zinit load "zsh-users/zsh-syntax-highlighting"

#zinit load "denysdovhan/spaceship-prompt"

zinit snippet ${ZDOTDIR}/.zsh/10_utils_git.zsh
zinit snippet ${ZDOTDIR}/.zsh/25_direnv.zsh
zinit snippet ${ZDOTDIR}/.zsh/25_gpg.zsh
zinit snippet ${ZDOTDIR}/.zsh/30_aliases.zsh
#zinit snippet ${ZDOTDIR}/.zsh/50_prompt.zsh
zinit snippet ${ZDOTDIR}/.zsh/60_history.zsh

zinit ice silent wait pick"init.sh"
zinit load "b4b4r07/enhancd"
export ENHANCD_FILTER="fzf --height 50% --reverse --ansi --preview 'ls -l {}' --preview-window down"
export ENHANCD_DOT_SHOW_FULLPATH=1

zinit ice silent wait pick"nix-shell.plugin.zsh"
zinit load "chisui/zsh-nix-shell"

