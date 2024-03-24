# Kubectl Setup
sudo apt update
sudo apt install ca-certificates curl
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install kubectl

# Helm Setup
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# k9s Setup
wget https://github.com/derailed/k9s/releases/download/v0.31.9/k9s_Linux_amd64.tar.gz
tar -xzvf k9s_Linux_amd64.tar.gz
sudo rm /usr/local/bin/k9s
sudo mv k9s /usr/local/bin/k9s
mkdir $HOME/.config/k9s -p
rm $HOME/.config/k9s/config.yaml $HOME/.config/k9s/skins -rf
ln -s "$(pwd)/k9s/skins" "${HOME}/.config/k9s/skins"
ln -s "$(pwd)/k9s/config.yaml" "${HOME}/.config/k9s/config.yaml"
