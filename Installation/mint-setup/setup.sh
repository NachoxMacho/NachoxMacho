# Setup VSCode settings link to use this repository
ln -s "$(pwd)/.vscode/settings.json" "${HOME}/.config/VSCodium/User/settings.json"
ln -s "$(pwd)/.vscode/keybindings.json" "${HOME}/.config/VSCodium/User/keybindings.json"

# Setup NeoVim settings
ln -s "$(pwd)/nvim" "${HOME}/.config/nvim"

# Install NeoVim
sudo apt install neovim

# Needed for telescope in nvim
sudo apt install ripgrep

# Install Catppucin Theme
unzip "$(pwd)/packages/Themes/Catppuccin-Mocha-Standard-Maroon-Dark.zip" -d "${HOME}/.themes"
mkdir "${HOME}/.config"
ln -s "${HOME}/.themes/Catppuccin-Mocha-Standard-Maroon-Dark/gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets"
ln -s "${HOME}/.themes/Catppuccin-Mocha-Standard-Maroon-Dark/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css"
ln -s "${HOME}/.themes/Catppuccin-Mocha-Standard-Maroon-Dark/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"

# Install Candy Icon Theme
mkdir "${HOME}/.icons"
unzip "$(pwd)/packages/Themes/candy-icons-master.zip" -d "${HOME}/.icons"

# Configure to use new themes
gsettings set org.gnome.desktop.interface icon-theme candy-icons-master
gsettings set org.gnome.desktop.interface gtk-theme Catppuccin-Mocha-Standard-Maroon-Dark


# Install standard packages
# Git
sudo apt install git
sudo apt install gpg

# Git Setup
gpg --full-generate-key
gpg --list-secret-keys --keyid-format=long
pass init "<key-id>"
git config --global credential.credentialStore gpg
gpg --armor --export "<key-id>"

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# OpenSCAD
sudo apt install openscad

# Tmux
sudo apt install tmux
mkdir ~/.config/tmux
ln -s "$(pwd)/tmux/tmux.conf" "${HOME}/.config/tmux/tmux.conf"
