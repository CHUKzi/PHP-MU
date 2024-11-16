#!/bin/bash

# PHP MU Setup Script
clear
echo "=================================================================="
echo "Welcome to PHP MU"
echo "=================================================================="
echo "1) Server Setup For Multiple Projects (PHP 8.1, PHP 8.2, PHP 8.3)"
echo ""
echo "Dev By : Royan (C H U K Z !)                             v.1"
echo "=================================================================="

read -p "Enter your choice: " choice

if [ "$choice" == "1" ]; then
    echo "Starting server setup..."
    echo ""

    # Update and upgrade system packages
    echo "Step 1/5: Updating and upgrading system packages..."
    sudo apt update && sudo apt upgrade -y
    echo "25% completed."

    # Install software-properties-common
    echo "Step 2/5: Installing software-properties-common..."
    sudo apt install software-properties-common -y
    echo "40% completed."

    # Add Ondřej Surý's PPA for PHP
    echo "Step 3/5: Adding PHP PPA repository..."
    sudo add-apt-repository ppa:ondrej/php -y
    sudo apt update
    echo "60% completed."

    # Install multiple PHP versions
    echo "Step 4/5: Installing PHP 8.1, PHP 8.2, PHP 8.3 and extensions..."
    sudo apt install -y php8.1 php8.1-fpm php8.1-mysql php8.1-mbstring php8.1-dom php8.1-xml php8.1-curl php8.1-zip php8.1-bcmath php8.1-intl php8.1-soap php8.1-gd php8.1-imagick \
    php8.2 php8.2-fpm php8.2-mysql php8.2-mbstring php8.2-dom php8.2-xml php8.2-curl php8.2-zip php8.2-bcmath php8.2-intl php8.2-soap php8.2-gd php8.2-imagick \
    php8.3 php8.3-fpm php8.3-mysql php8.3-mbstring php8.3-dom php8.3-xml php8.3-curl php8.3-zip php8.3-bcmath php8.3-intl php8.3-soap php8.3-gd php8.3-imagick
    echo "85% completed."

    # Finalizing setup
    echo "Step 5/5: Finalizing setup and cleaning up..."
    sudo apt autoremove -y
    echo "100% completed."

    echo ""
    echo "=================================================================="
    echo "Server setup is complete! PHP 8.1, 8.2, and 8.3 have been installed."
    echo "=================================================================="
else
    echo "Invalid choice. Exiting."
fi
