autoload -Uz vcs_info


precmd() {
  psvar=()
  vcs_info
  [[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"
  [[ -n $NIX_SHELL_ENV ]] && psvar[2]="$NIX_SHELL_ENV"
}


PROMPT="
┌──%(2v.%F{136}%B[%2v]%b.)%f(%F{red}%n%F{white}@%F{64}%m%f: %F{243}%/%(1v.%F{61}%1v.)%f #%b%F{grey})%E
└─╼ "

