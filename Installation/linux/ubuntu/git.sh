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
git config --global user.email 'rtowens17@gmail.com'

# Git global ignore for vim tags
mkdir "${HOME}/.config/git"
ln -s "$(pwd)/git/ignore" "${HOME}/.config/git/ignore"
