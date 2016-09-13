export DEBIAN_FRONTEND=noninteractive

# Make sur that all the packages are up to date
apt update
apt upgrade -y

# Installing required packages
apt install -y git curl php7.0-cli php7.0-mbstring php7.0-xml zip
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

# Cloning 6admin
cd /opt
git clone https://github.com/6admin/6admin.git

# Install core dependencies (update as we are on dev)
cd /opt/6admin/core
composer update

# Installing the six command
cd /opt/6admin
chmod +x six
ln -s /opt/6admin/six /usr/local/bin/six

export DEBIAN_FRONTEND=dialog
