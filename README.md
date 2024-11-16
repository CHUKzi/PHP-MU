# PHP-MU

PHP-MU is a shell script designed to set up a server environment with multiple PHP versions (8.1, 8.2, and 8.3) along with their commonly used extensions. This script automates the installation process, making it quick and efficient.

## Features
- Installs PHP 8.1, PHP 8.2, and PHP 8.3.
- Configures extensions such as `mysql`, `mbstring`, `dom`, `xml`, `curl`, `zip`, `bcmath`, `intl`, `soap`, `gd`, and `imagick`.
- Includes a step-by-step progress indicator.
- Cleans up unnecessary packages after installation.

---

## Requirements
- Ubuntu or Debian-based Linux distribution.
- Root or `sudo` access.

---

## Installation

1. Clone or download this repository to your local machine.

2. Make the script executable:
   ```bash
   chmod +x php-mu.sh