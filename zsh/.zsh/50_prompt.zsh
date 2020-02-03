## Before styling the prompt, make sure it is reset to the default prompt theme
#prompt default
#
## Autoload VSC info 
#autoload -Uz vcs_info
#
#
#precmd() {
#  psvar=()
#  vcs_info
#  [[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"
#  [[ -n $name ]] && [[ -n "$IN_NIX_SHELL" ]] && psvar[2]="${name#'lorri-wrapped-project-'}"
#  is_git_crypt_locked && psvar[3]="1"
#}
#
#
#PROMPT="
#┌──%(2V.%F{136}%B[%2v]%b.)%f(%F{red}%n%F{white}@%F{64}%m%f: %F{243}%/%(1V.%F{61}%1v.)%f%(3V.%F{red}%B[LOCKED]%b.)%f #%b%F{grey})%E
#└─◉ "

SPACESHIP_USER_SHOW="always"

SPACESHIP_GIT_SYMBOL=" "
SPACESHIP_GIT_BRANCH_PREFIX="$SPACESHIP_GIT_SYMBOL"
SPACESHIP_PACKAGE_SYMBOL=" "
SPACESHIP_DOCKER_SYMBOL="  "
SPACESHIP_NIX_SYMBOL=" "
SPACESHIP_GOLANG_SYMBOL=" "
SPACESHIP_NODE_SYMBOL=" "
SPACESHIP_RUST_SYMBOL=" "
SPACESHIP_AWS_SYMBOL="  "
SPACESHIP_PYENV_SYMBOL=" "

SPACESHIP_NIX_SHELL_SHOW="${SPACESHIP_NIX_SHELL_SHOW=true}"
SPACESHIP_NIX_SHELL_COLOR="${SPACESHIP_NIX_SHELL_COLOR="cyan"}"
SPACESHIP_NIX_SHELL_PREFIX="${SPACESHIP_NIX_SHELL_PREFIX="using "}"
SPACESHIP_NIX_SHELL_SUFFIX="${SPACESHIP_NIX_SHELL_SUFFIX=$SPACESHIP_PROMPT_DEFAULT_SUFFIX}"
SPACESHIP_NIX_SHELL_SYMBOL="${SPACESHIP_NIX_SHELL_SYMBOL=$SPACESHIP_NIX_SYMBOL}"

spaceship_nix_shell() {
  [[ $SPACESHIP_NIX_SHELL_SHOW == false ]] && return

  [ -n "$IN_NIX_SHELL" ] && [ -n "$name" ] || return

  local text=""
  if [[ $SPACESHIP_DIR_TRUNC_REPO != true ]]; then
    text="${name#'lorri-wrapped-project-'}"
  fi
  # Display nix_shell section
  spaceship::section \
    "$SPACESHIP_NIX_SHELL_COLOR" \
    "$SPACESHIP_NIX_SHELL_PREFIX" \
    "$SPACESHIP_NIX_SHELL_SYMBOL" \
    "$text " \
    "$SPACESHIP_NIX_SHELL_SUFFIX"
}

SPACESHIP_GIT_CRYPT_SHOW="${SPACESHIP_GIT_CRYPT_SHOW=true}"
SPACESHIP_GIT_CRYPT_COLOR="${SPACESHIP_GIT_CRYPT_COLOR="red"}"
SPACESHIP_GIT_CRYPT_PREFIX="${SPACESHIP_GIT_CRYPT_PREFIX=""}"
SPACESHIP_GIT_CRYPT_TEXT="${SPACESHIP_GIT_CRYPT_TEXT="[LOCKED] "}"
SPACESHIP_GIT_CRYPT_SUFFIX="${SPACESHIP_GIT_CRYPT_SUFFIX=$SPACESHIP_PROMPT_DEFAULT_SUFFIX}"

spaceship_git_crypt() {
  [[ $SPACESHIP_GIT_CRYPT_SHOW == false ]] && return

  spaceship::is_git && git ls-tree -r master --name-only | sed 's/.*/"&"/' | xargs grep -qsPa "\x00GITCRYPT" || return

  # Display nix_shell section
  spaceship::section \
    "$SPACESHIP_GIT_CRYPT_COLOR" \
    "$SPACESHIP_GIT_CRYPT_PREFIX" \
    "$SPACESHIP_GIT_CRYPT_TEXT " \
    "$SPACESHIP_GIT_CRYPT_SUFFIX"
}

autoload -U promptinit && promptinit

local neworder=()
for item in $SPACESHIP_PROMPT_ORDER; do
  if [[ $item == 'user' ]]; then
    neworder+=($item nix_shell)
  elif [[ $item == 'git' ]]; then
    neworder+=($item git_crypt)
  else
    neworder+=($item)
  fi
done

SPACESHIP_PROMPT_ORDER=($neworder)
