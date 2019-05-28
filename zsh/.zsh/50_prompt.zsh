autoload -Uz vcs_info


precmd() {
  psvar=()
  vcs_info
  [[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"
  [[ -n $name ]] && psvar[2]="$name"
  is_git_crypt_locked && psvar[3]="1"
}


PROMPT="
┌──%(2V.%F{136}%B[%2v]%b.)%f(%F{red}%n%F{white}@%F{64}%m%f: %F{243}%/%(1V.%F{61}%1v.)%f%(3V.%F{red}%B[LOCKED]%b.)%f #%b%F{grey})%E
└─◉ "
