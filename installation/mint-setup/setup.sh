# Setup NeoVim settings
ln -s "$(pwd)/nvim" "${HOME}/.config/nvim"


# Install NeoVim
sudo apt install neovim

# Needed for telescope in nvim
sudo apt install ripgrep
sudo apt install gcc
sudo apt install make
sudo apt install universal-ctags

# Ctags global ignore file
ln -s "$(pwd)/ctags/global.ctags" "${HOME}/.config/global.ctags"

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

../linux/ubuntu/git.sh
../linux/ubuntu/npm.sh

# OpenSCAD
sudo apt install openscad

../linux/ubuntu/tmux.sh
../linux/ubuntu/ranger.sh
../linux/ubuntu/shell.sh
../linux/ubuntu/kubernetes-controls.sh
../linux/ubuntu/pwsh.sh
../linux/ubuntu/go.sh
