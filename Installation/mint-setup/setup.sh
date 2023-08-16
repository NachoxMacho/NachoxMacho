# Setup VSCode settings link to use this repository
ln -s "$(pwd)/.vscode/settings.json" "${HOME}/.config/VSCodium/User/settings.json"
ln -s "$(pwd)/.vscode/keybindings.json" "${HOME}/.config/VSCodium/User/keybindings.json"

# Setup NeoVim settings
ln -s "$(pwd)/nvim" "${HOME}/.config/nvim"

# Install NeoVim
sudo apt install neovim

# Needed for telescope in nvim
sudo apt install ripgrep
sudo apt install gcc
sudo apt install make
sudo apt install universal-ctags

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

git config --global user.name 'Rob Owens'
git config --global user.email 'email'

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# OpenSCAD
sudo apt install openscad

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo apt install tmux
mkdir ~/.config/tmux
ln -s "$(pwd)/tmux/tmux.conf" "${HOME}/.config/tmux/tmux.conf"

# Ranger
sudo apt install ranger
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
ln -s "$(pwd)/ranger/rc.conf" "${HOME}/.config/ranger/rc.conf"

# Bat (Ranger preview)
sudo apt install bat
mkdir -p "${HOME}/.local/bin"
ln -s /usr/bin/batcat "${HOME}/.local/bin/bat"
mkdir "${HOME}/.config/bat"
ln -s "$(pwd)/bat/config" "${HOME}/.config/bat/config"
ln -s "$(pwd)/bat/themes" "${HOME}/.config/bat/themes"

# Bash Setup
ln -s "$(pwd)/bash/.bashrc" "${HOME}/.bashrc"
ln -s "$(pwd)/bash/.bash_aliases" "${HOME}/.bash_aliases"

# Kubectl Setup
sudo apt update
sudo apt instaall ca-certificates curl
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install kubectl
