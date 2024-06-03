
# Git dotfiles
mkdir -p "${HOME}/.config"
ln -s "$(pwd)/git" "${HOME}/.config/git"
ln -s "$(pwd)/ssh/config" "${HOME}/.ssh/config"

# Neovim
mkdir -p "${HOME}/.config"
ln -s "$(pwd)/nvim" "${HOME}/.config/nvim"

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

# Bash Setup
rm ~/.bashrc
ln -s "$(pwd)/bash/.bashrc" "${HOME}/.bashrc"
rm ~/.bash_aliases
ln -s "$(pwd)/bash/.bash_aliases" "${HOME}/.bash_aliases"

# ZSH Setup
sudo apt install zsh
chsh -s $(which zsh)
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh > ~/.oh-my-installer && chmod +x ~/.oh-my-installer && ~/.oh-my-installer
git clone 'https://github.com/zsh-users/zsh-autosuggestions.git' "~/.oh-my-zsh/plugins/zsh-autosuggestions"
rm "${HOME}/.zshrc"
mkdir ~/.zsh
ln -s "$(pwd)/zsh/.zshrc" "${HOME}/.zshrc"
ln -s "$(pwd)/zsh/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh" "${HOME}/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh"
ln -s "$(pwd)/.local/bin/tmux-sessionizer" "${HOME}/.local/bin/tmux-sessionizer"
