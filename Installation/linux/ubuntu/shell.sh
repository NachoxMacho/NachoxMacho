# Bash Setup
rm ~/.bashrc
ln -s "$(pwd)/bash/.bashrc" "${HOME}/.bashrc"
rm ~/.bash_aliases
ln -s "$(pwd)/bash/.bash_aliases" "${HOME}/.bash_aliases"
