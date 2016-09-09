export DEBIAN_FRONTEND=noninteractive

# Make sur that all the packages are up to date
apt update
apt upgrade -y

# Installing required packages
apt install -y git php7.0-cli curl
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

# Installing 6admin
cd /opt
git clone git@github.com:6admin/6admin.git
cd 6admin

composer install

sudo export DEBIAN_FRONTEND=dialog