# Kubectl Setup
brew install kubectl

# Helm Setup
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# k9s Setup
brew install k9s
mkdir $HOME/.config/k9s -p
rm $HOME/.config/k9s/config.yaml $HOME/.config/k9s/skins -rf
ln -s "$(pwd)/k9s/skins" "${HOME}/.config/k9s/skins"
ln -s "$(pwd)/k9s/config.yaml" "${HOME}/.config/k9s/config.yaml"


# Trivy Setup
brew install trivy
