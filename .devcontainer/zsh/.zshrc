source $ZDOTDIR/.zprofile

: ${PROFILE_ROOT:?}

OMZ="$PROFILE_ROOT/share/oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	git
	fzf
	zoxide
	kubectl
)

source $OMZ/oh-my-zsh.sh

source $PROFILE_ROOT/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $PROFILE_ROOT/share/zsh-autosuggestions/zsh-autosuggestions.zsh
