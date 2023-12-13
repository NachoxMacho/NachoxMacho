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

# JQ for JSON Previews
sudo apt install jq
