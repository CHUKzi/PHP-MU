#!/bin/bash

# PHP MU Setup Script
clear
echo "=================================================================="
echo "Welcome to PHP MU"
echo "=================================================================="
echo "1) Server Setup For Multiple Projects (PHP 7.4, PHP 8.1, PHP 8.2, PHP 8.3)"
echo "2) Show list of PHP extensions"
echo ""
echo "Dev By : Royan (C H U K Z !)                             v.1"
echo "=================================================================="

read -p "Enter your choice: " choice

if [ "$choice" == "1" ]; then
    echo "Starting server setup..."
    echo ""

    # Update and upgrade system packages
    echo "Step 1/6: Updating and upgrading system packages..."
    sudo apt update && sudo apt upgrade -y
    echo "15% completed."

    # Install software-properties-common
    echo "Step 2/6: Installing software-properties-common..."
    sudo apt install software-properties-common -y
    echo "30% completed."

    # Add Ondřej Surý's PPA for PHP
    echo "Step 3/6: Adding PHP PPA repository..."
    sudo add-apt-repository ppa:ondrej/php -y
    sudo apt update
    echo "45% completed."

    # Install multiple PHP versions and grpc extensions
    echo "Step 4/6: Installing PHP 7.4, PHP 8.1, PHP 8.2, PHP 8.3 and extensions..."
    sudo apt install -y \
    php7.4 php7.4-fpm php7.4-mysql php7.4-mbstring php7.4-dom php7.4-xml php7.4-curl php7.4-zip php7.4-bcmath php7.4-intl php7.4-soap php7.4-gd php7.4-imagick php7.4-grpc \
    php8.1 php8.1-fpm php8.1-mysql php8.1-mbstring php8.1-dom php8.1-xml php8.1-curl php8.1-zip php8.1-bcmath php8.1-intl php8.1-soap php8.1-gd php8.1-imagick php8.1-grpc \
    php8.2 php8.2-fpm php8.2-mysql php8.2-mbstring php8.2-dom php8.2-xml php8.2-curl php8.2-zip php8.2-bcmath php8.2-intl php8.2-soap php8.2-gd php8.2-imagick php8.2-grpc \
    php8.3 php8.3-fpm php8.3-mysql php8.3-mbstring php8.3-dom php8.3-xml php8.3-curl php8.3-zip php8.3-bcmath php8.3-intl php8.3-soap php8.3-gd php8.3-imagick php8.3-grpc
    echo "75% completed."

    # Enable necessary PHP versions and extensions
    echo "Step 5/6: Enabling PHP versions and configurations..."
    sudo update-alternatives --set php /usr/bin/php7.4
    echo "Default PHP version set to 7.4."
    echo "90% completed."

    # Finalizing setup
    echo "Step 6/6: Finalizing setup and cleaning up..."
    sudo apt autoremove -y
    echo "100% completed."

    echo ""
    echo "=================================================================="
    echo "Server setup is complete! PHP 7.4, 8.1, 8.2, and 8.3 with gRPC extension have been installed."
    echo "=================================================================="
elif [ "$choice" == "2" ]; then
    echo "Available PHP extensions for installed versions:"
    echo "=================================================================="
    for version in 7.4 8.1 8.2 8.3; do
        echo "PHP $version Extensions:"
        php$version -m
        echo "------------------------------------------------------------------"
    done
    echo "=================================================================="
else
    echo "Invalid choice. Exiting."
fi
