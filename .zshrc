ZSH_THEME='zsh-theme-powerlevel10k'

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
plugins=(
  autoenv
  docker
  docker-compose
  fzf
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh
#############################
bindkey '^H' backward-kill-word

alias q='exit'

export EDITOR="nvim"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH=~/bin:$PATH
export TERM=xterm-256color
source ~/powerlevel10k/powerlevel10k.zsh-theme

fastfetch
