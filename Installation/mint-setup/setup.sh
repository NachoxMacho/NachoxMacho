# Setup VSCode settings link to use this repository
ln -s "$(pwd)/.vscode/settings.json" "${HOME}/.config/VSCodium/User/settings.json"
ln -s "$(pwd)/.vscode/keybindings.json" "${HOME}/.config/VSCodium/User/keybindings.json"

# Install Catppucin Theme
unzip "$(pwd)/packages/Themes/Catppuccin-Mocha-Standard-Maroon-Dark.zip" -d "${HOME}/.themes"
ln -s "${HOME}/.themes/Catppuccin-Mocha-Standard-Maroon-Dark/gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets"
ln -s "${HOME}/.themes/Catppuccin-Mocha-Standard-Maroon-Dark/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css"
ln -s "${HOME}/.themes/Catppuccin-Mocha-Standard-Maroon-Dark/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"

# Install Candy Icon Theme
mkdir "${HOME}/.icons"
unzip "$(pwd)/packages/Themes/candy-icons-master.zip" -d "${HOME}/.icons"

# Configure to use new themes
gsettings set org.gnome.desktop.interface icon-theme candy-icons-master
gsettings set org.gnome.desktop.interface gtk-theme Catppuccin-Mocha-Standard-Maroon-Dark
