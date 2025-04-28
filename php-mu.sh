#!/bin/bash

# PHP MU Setup Script
clear
echo "=================================================================="
echo "Welcome to PHP MU"
echo "=================================================================="
echo "1) Server Setup For Multiple Projects (PHP 7.4, PHP 8.1, PHP 8.2, PHP 8.3, PHP 8.4)"
echo "2) Show list of PHP extensions"
echo "3) Choose specific PHP version to install"
echo ""
echo "Dev By : Royan (C H U K Z !)                             v.1.2"
echo "=================================================================="

read -p "Enter your choice: " choice

if [ "$choice" == "1" ]; then
    echo "Starting server setup for all PHP versions..."
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

    # Install all PHP versions and extensions
    echo "Step 4/6: Installing all PHP versions and extensions..."
    sudo apt install -y \
    php7.4 php7.4-fpm php7.4-mysql php7.4-mbstring php7.4-dom php7.4-xml php7.4-curl php7.4-zip php7.4-bcmath php7.4-intl php7.4-soap php7.4-gd php7.4-imagick php7.4-grpc php7.4-redis \
    php8.1 php8.1-fpm php8.1-mysql php8.1-mbstring php8.1-dom php8.1-xml php8.1-curl php8.1-zip php8.1-bcmath php8.1-intl php8.1-soap php8.1-gd php8.1-imagick php8.1-grpc php8.1-redis \
    php8.2 php8.2-fpm php8.2-mysql php8.2-mbstring php8.2-dom php8.2-xml php8.2-curl php8.2-zip php8.2-bcmath php8.2-intl php8.2-soap php8.2-gd php8.2-imagick php8.2-grpc php8.2-redis \
    php8.3 php8.3-fpm php8.3-mysql php8.3-mbstring php8.3-dom php8.3-xml php8.3-curl php8.3-zip php8.3-bcmath php8.3-intl php8.3-soap php8.3-gd php8.3-imagick php8.3-grpc php8.3-redis \
    php8.4 php8.4-fpm php8.4-mysql php8.4-mbstring php8.4-dom php8.4-xml php8.4-curl php8.4-zip php8.4-bcmath php8.4-intl php8.4-soap php8.4-gd php8.4-imagick php8.4-grpc php8.4-redis
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
    echo "Server setup is complete! PHP 7.4, 8.1, 8.2, 8.3, and 8.4 with gRPC extension have been installed."
    echo "=================================================================="

elif [ "$choice" == "2" ]; then
    echo "Available PHP extensions for installed versions:"
    echo "=================================================================="
    for version in 7.4 8.1 8.2 8.3 8.4; do
        echo "PHP $version Extensions:"
        php$version -m
        echo "------------------------------------------------------------------"
    done
    echo "=================================================================="

elif [ "$choice" == "3" ]; then
    echo "Choose PHP version to install:"
    echo "1) PHP 7.4"
    echo "2) PHP 8.1"
    echo "3) PHP 8.2"
    echo "4) PHP 8.3"
    echo "5) PHP 8.4"
    read -p "Enter your PHP version choice: " php_choice

    case $php_choice in
        1)
            php_version="7.4"
            ;;
        2)
            php_version="8.1"
            ;;
        3)
            php_version="8.2"
            ;;
        4)
            php_version="8.3"
            ;;
        5)
            php_version="8.4"
            ;;
        *)
            echo "Invalid PHP version choice. Exiting."
            exit 1
            ;;
    esac

    echo "Installing PHP $php_version and required extensions..."

    # Update and install required repositories
    sudo apt update
    sudo apt install software-properties-common -y
    sudo add-apt-repository ppa:ondrej/php -y
    sudo apt update

    # Install the selected PHP version and its extensions
    sudo apt install -y \
    php$php_version php$php_version-fpm php$php_version-mysql php$php_version-mbstring php$php_version-dom php$php_version-xml php$php_version-curl php$php_version-zip php$php_version-bcmath php$php_version-intl php$php_version-soap php$php_version-gd php$php_version-imagick php$php_version-grpc php$php_version-redis

    echo "Setting PHP $php_version as default..."
    sudo update-alternatives --set php /usr/bin/php$php_version

    echo "Cleaning up..."
    sudo apt autoremove -y

    echo ""
    echo "=================================================================="
    echo "PHP $php_version and its extensions have been successfully installed!"
    echo "=================================================================="

else
    echo "Invalid choice. Exiting."
fi
