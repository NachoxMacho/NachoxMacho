# Install NeoVim
# sudo snap install neovim --channel=edge

brew install neovim

# Needed for telescope in nvim
sudo apt install ripgrep
sudo apt install gcc
sudo apt install make
sudo apt install universal-ctags
sudo apt install unzip
sudo apt install fd-find

mkdir -p "${HOME}/.config"
ln -s "$(pwd)/nvim" "${HOME}/.config/nvim"
