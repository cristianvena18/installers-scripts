# Actualizar el sistema
echo "updating packages..."
sudo pacman -Syu

# Install git
echo "installing git..."
sudo pacman -S git base-devel

# Grab snap from AUR
echo "grabbing snap from AUR..."
git clone https://aur.archlinux.org/snapd.git

echo "starting the building procedure..."
snapd/makepkg -sri

# Enable snap socket
echo "enable snap socket..."
sudo systemctl enable --now snapd.socket

systemctl status snapd.socket

#
echo "do something..."
sudo ln -s /var/lib/snapd/snap /snap

# Install core snap
echo "installing snap core..."
sudo snap install core

# install slack
echo "installing slack..."
sudo snap install slack --classic

# Installer google chromium
echo "installing chromium..."
sudo pacman -S chromium-browser

# install snap
# sudo pacman -S snapd

# install vscode
echo "installing vscode..."
sudo snap install --classic code

# install phpstorm
echo "installing php storm..."
sudo snap install --classic phpstorm

# install webstorm
echo "installing webstorm..."
sudo snap install --classic webstorm

# cURL
# sudo pacman -S -y curl

# Node
# curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
echo "installing node and npm..."
sudo pacman -S nodejs npm

# Yarn
# curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
echo "installing yarn..."
sudo pacman -S -y yarn

# Lerna
echo "installing lerna..."
sudo yarn global add lerna

# PM2 - Server only
# sudo yarn global add pm2

# Docker

# Enable the loop module
echo "enabling the loop module..."
sudo tee /etc/modules-load.d/loop.conf <<< "loop"

echo "cloning docker-git from repository..."
git clone https://aur.archlinux.org/docker-git.git

echo "starting the building procedure..."
docker-git/makepkg -sri

echo "starting docker service..."
sudo systemctl start docker.service

echo "enabling docker service..."
sudo systemctl enable docker.service

echo "adding docker to the docker group..."
sudo groupadd docker

echo "adding user to docker in user $USER"
sudo usermod -aG docker $USER

# echo "creating folder "
# sudo mkdir -p /home/docker

# echo "stopping docker service..."
# sudo systemctl stop docker.service

# sudo touch /etc/systemd/system/docker.service.d/docker.conf

# echo "[Service]" > /etc/systemd/system/docker.service.d/docker.conf
# echo "ExecStart=" > /etc/systemd/system/docker.service.d/docker.conf
# echo "ExecStart=/usr/bin/docker daemon -g /home/docker" > /etc/systemd/system/docker.service.d/docker.conf

echo "updating packages and installing dependencies for docker..."
sudo pacman -Syu && sudo pacman -S docker-ce docker-ce-cli containerd.io

echo "Log out and log back in so that your group membership is re-evaluated."

# Docker-Compose
echo "installing docker-compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
