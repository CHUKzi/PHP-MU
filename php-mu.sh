#!/bin/bash

# PHP MU Setup Script (v1.3 - Ubuntu 24+ Compatible)
clear
echo "=================================================================="
echo "Welcome to PHP MU"
echo "=================================================================="
echo "1) Server Setup For Multiple Projects (PHP 7.4, PHP 8.1, PHP 8.2, PHP 8.3, PHP 8.4)"
echo "2) Show list of PHP extensions"
echo "3) Choose specific PHP version to install"
echo ""
echo "Dev By : Royan (C H U K Z !)                             v.1.3"
echo "=================================================================="

read -p "Enter your choice: " choice

# Detect Ubuntu codename
UBUNTU_CODENAME=$(lsb_release -cs)
UNSUPPORTED_PPA=false

# Check for PPA support
if [[ "$UBUNTU_CODENAME" == "oracular" || "$UBUNTU_CODENAME" == "noble" ]]; then
    UNSUPPORTED_PPA=true
    echo "⚠️  Note: Ubuntu $UBUNTU_CODENAME is not officially supported by ppa:ondrej/php."
    echo "⚠️  Some PHP versions may not be available via apt. Consider using Ubuntu 22.04 LTS for full support."
fi

add_php_ppa() {
    if [ "$UNSUPPORTED_PPA" = false ]; then
        echo "Adding PHP PPA..."
        sudo add-apt-repository ppa:ondrej/php -y
        sudo apt update
    else
        echo "⛔ Skipping PPA: Not supported for $UBUNTU_CODENAME"
    fi
}

if [ "$choice" == "1" ]; then
    echo "Starting server setup for all PHP versions..."
    echo ""

    echo "Step 1/6: Updating and upgrading system packages..."
    sudo apt update && sudo apt upgrade -y
    echo "15% completed."

    echo "Step 2/6: Installing software-properties-common..."
    sudo apt install software-properties-common -y
    echo "30% completed."

    echo "Step 3/6: Adding PHP PPA repository..."
    add_php_ppa
    echo "45% completed."

    echo "Step 4/6: Installing all available PHP versions and extensions..."
    for version in 7.4 8.1 8.2 8.3 8.4; do
        echo "Installing PHP $version..."
        sudo apt install -y php$version php$version-fpm php$version-mysql php$version-mbstring \
        php$version-dom php$version-xml php$version-curl php$version-zip php$version-bcmath \
        php$version-intl php$version-soap php$version-gd php$version-imagick \
        php$version-redis php$version-grpc || echo "⚠️ Skipping PHP $version - Package not found"
    done
    echo "75% completed."

    echo "Step 5/6: Setting PHP 7.4 as default..."
    sudo update-alternatives --set php /usr/bin/php7.4 || echo "⚠️ Could not set default PHP"
    echo "90% completed."

    echo "Step 6/6: Finalizing setup and cleaning up..."
    sudo apt autoremove -y
    echo "100% completed."

    echo ""
    echo "=================================================================="
    echo "Server setup complete (subject to available PHP packages for your Ubuntu version)."
    echo "=================================================================="

elif [ "$choice" == "2" ]; then
    echo "Available PHP extensions for installed versions:"
    echo "=================================================================="
    for version in 7.4 8.1 8.2 8.3 8.4; do
        if command -v php$version >/dev/null 2>&1; then
            echo "PHP $version Extensions:"
            php$version -m
            echo "------------------------------------------------------------------"
        else
            echo "PHP $version not installed or not available."
            echo "------------------------------------------------------------------"
        fi
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
        1) php_version="7.4" ;;
        2) php_version="8.1" ;;
        3) php_version="8.2" ;;
        4) php_version="8.3" ;;
        5) php_version="8.4" ;;
        *) echo "Invalid PHP version choice. Exiting."; exit 1 ;;
    esac

    echo "Installing PHP $php_version and required extensions..."

    sudo apt update
    sudo apt install software-properties-common -y
    add_php_ppa

    sudo apt install -y php$php_version php$php_version-fpm php$php_version-mysql \
    php$php_version-mbstring php$php_version-dom php$php_version-xml php$php_version-curl \
    php$php_version-zip php$php_version-bcmath php$php_version-intl php$php_version-soap \
    php$php_version-gd php$php_version-imagick php$php_version-redis php$php_version-grpc || {
        echo "❌ Error installing PHP $php_version - Possibly not supported on $UBUNTU_CODENAME"
        exit 1
    }

    echo "Setting PHP $php_version as default..."
    sudo update-alternatives --set php /usr/bin/php$php_version || echo "⚠️ Could not set PHP default."

    echo "Cleaning up..."
    sudo apt autoremove -y

    echo ""
    echo "=================================================================="
    echo "PHP $php_version and its extensions have been successfully installed!"
    echo "=================================================================="

else
    echo "Invalid choice. Exiting."
fi