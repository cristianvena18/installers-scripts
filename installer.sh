# Actualizar el sistema
sudo apt update && sudo apt upgrade -y

# Installer google chromium
sudo apt-get install chromium-browser

# install snap
sudo apt-get install snapd

# install vscode
sudo snap install --classic code

# install phpstorm
sudo snap install --classic phpstorm

# install webstorm
sudo snap install --classic webstorm

# cURL
sudo apt install -y curl

# Node
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs

# Yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn

# Lerna
# sudo yarn global add lerna

# PM2 - Server only
# sudo yarn global add pm2

# Docker
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io

sudo groupadd docker
sudo usermod -aG docker $USER
echo "Log out and log back in so that your group membership is re-evaluated."

# Docker-Compose

sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
