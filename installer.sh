# Actualizar el sistema
echo "UPDATING SYSTEM..."
sudo apt update -y && sudo apt upgrade -y

# Installer google chromium
echo "INSTALLING CHROME..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb

# install snap
echo "INSTALLING SNAP..."
sudo apt-get install -y snapd

# install vscode
echo "INSTALLING VSCODE..."
sudo snap install --classic code

# install phpstorm
echo "INSTALLING PHPSTORM..."
sudo snap install --classic phpstorm

# install webstorm
echo "INSTALLING WEBSTORM..."
sudo snap install --classic webstorm


echo "INSTALLING SLACK..."
sudo snap install slack --classic

# cURL
echo "INSTALLING CURL..."
sudo apt install -y curl

# workbench
echo "INSTALLING WORKBENCH..."
sudo apt install -y mysql-workbench

# Node
echo "INSTALLING NODE..."
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs

# Yarn
echo "INSTALLING YARN..."
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn

# Lerna
echo "INSTALLING LERNA..."
sudo yarn global add lerna

# PM2 - Server only
# sudo yarn global add pm2

# Docker
echo "INSTALLING DOCKER..."
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
echo "INSTALLING DOCKER..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo apt-get install vim

sudo apt-get install alacritty

sudo apt-get install xclip

git clone https://github.com/cristianvena18/dotfiles

HOME="/home/$USER"

cp -R dotfiles "$HOME"

echo "Quiere generar la clave ssh?"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ; then
	echo "Ingrese su mail"
	read email
	

	ssh-keygen -t rsa -b 4096 -C "$email"	

	if [ -f "$HOME/.ssh/id_rsa.pub" ] ; then
		xclip -sel clip < ~/.ssh/id_rsa.pub
		echo "Ssh copied to clipboard"
	fi
fi
