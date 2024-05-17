# Install NeoVim
# sudo snap install neovim --channel=edge

sudo rm /usr/local/bin/nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

# Needed for telescope in nvim
sudo apt install ripgrep
sudo apt install gcc
sudo apt install make
sudo apt install universal-ctags
sudo apt install unzip
sudo apt install fd-find

mkdir -p "${HOME}/.config"
ln -s "$(pwd)/nvim" "${HOME}/.config/nvim"
