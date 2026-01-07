# no sudo password
echo "yazeed ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers >/dev/null
# install apps
sudo dnf install --assumeyes git neovim zsh unzip fzf ripgrep man tldr stow

if [[ -z "expression" ]]; then
	command ...
fi

# zsh
chsh -s $(which zsh)
sh -c "$(curl -faSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# configs
stow .
