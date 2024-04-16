# Git
sudo apt install git
sudo apt install gpg
sudo apt install pass

# Git Setup
ssh-keygen -t ed25519 -C "rtowens17@gmail.com"

git config --global user.name 'Rob Owens'
git config --global user.email 'rtowens17@gmail.com'

# Git global ignore for vim tags
mkdir -p "${HOME}/.config"
ln -s "$(pwd)/git" "${HOME}/.config/git"
ln -s "$(pwd)/ssh/config" "${HOME}/.ssh/config"
