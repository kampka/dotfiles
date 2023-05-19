# History
# # History file
export HISTFILE=~/.local/share/zsh/zsh_history
# History size in memory
export HISTSIZE=10000
# The number of histsize
export SAVEHIST=1000000
# The size of asking history
export LISTMAX=50
# Do not add in root
if [[ $UID == 0 ]]; then
	unset HISTFILE
	export SAVEHIST=0
fi
