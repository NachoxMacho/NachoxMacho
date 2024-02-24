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
ln -s "$(pwd)/bin/.local/scripts/tmux-sessionizer" "${HOME}/.local/bin/tmux-sessionizer"
