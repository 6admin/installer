export DEBIAN_FRONTEND=noninteractive

# Make sur that all the packages are up to date
apt-get update
apt-get upgrade -y

# Installing required packages
apt-get install -y git curl php7.0-cli php7.0-mbstring php7.0-xml zip
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Cloning 6admin
mkdir /opt/6admin
cd /opt/6admin
git init
git remote add origin https://github.com/6admin/6admin.git
git fetch
git checkout -t origin/master

# Install core dependencies (update as we are on dev)
cd /opt/6admin/core
composer update

# Installing the six command
cd /opt/6admin
chmod +x six
ln -s /opt/6admin/six /usr/local/bin/six

export DEBIAN_FRONTEND=dialog
