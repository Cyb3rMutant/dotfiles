# no sudo password
echo "yazeed ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers > /dev/null
# install apps
sudo pacman -S --noconfirm firefox git neovim zsh redshift pulseaudio xorg-xinput unzip kitty spectacle fzf ripgrep npm i3blocks picom man tldr pavucontrol feh ttf-dejavu ttf-liberation brightnessctl fd stow

# yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
yay -S --noconfirm fastfetch zsh-theme-powerlevel10k-git qlipper xkblayout acpi pulseaudio-alsa i3-layouts

# zsh
chsh -s $(which zsh)
sh -c "$(curl -faSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# configs
git clone https://github.com/cyb3rmutant/dotfiles
cd dotfiles
stow .
cd
cp old-stuff/.zsh_histor .

# firefox
echo export MOZ_USE_XINPUT2=1 | sudo tee /etc/profile.d/use-xinput2.sh

# pacman colorful
sudo sed -i '/^\[options\]/a Color\nVerbosePkgLists\nParallelDownloads=8\nILoveCandy' /etc/pacman.conf

# grub
sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
