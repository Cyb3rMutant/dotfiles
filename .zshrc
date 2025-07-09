# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
plugins=(
  autoenv
  fzf
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh
#############################
bindkey '^H' backward-kill-word

alias q='exit'
alias yaya="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro  yay -S"

alias cf="cd /home/yazeed/projects/cruise-frontend; nvim ."
alias cb="cd /home/yazeed/projects/cruise-backend; nvim ."
alias t="cd /home/yazeed/projects/tawfiq-register; nvim ."
alias s="cd /home/yazeed/projects/om-selenium; nvim ."
alias z="cd /home/yazeed/projects/ourmedia-html; nvim ."

export EDITOR="nvim"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH=~/bin:$PATH
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

fastfetch --logo arch
