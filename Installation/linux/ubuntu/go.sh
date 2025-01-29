# C++ Dev dependencies
sudo apt install libc++-dev

# Go install
GOVERSION=1.23.3
wget https://go.dev/dl/go$GOVERSION.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go$GOVERSION.linux-amd64.tar.gz
sudo rm go$GOVERSION.linux-amd64.tar.gz
