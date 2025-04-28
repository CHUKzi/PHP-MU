# PHP-MU

**PHP-MU** is a powerful shell script that sets up a server environment with multiple PHP versions (7.4, 8.1, 8.2, 8.3, and 8.4) along with their commonly used extensions.  
It automates the entire installation process, saving you time and avoiding manual setup errors.

---

## ✨ Features

- Install multiple PHP versions:
   - PHP 7.4
   - PHP 8.1
   - PHP 8.2
   - PHP 8.3
   - PHP 8.4
- Install essential PHP extensions for each version:
   - `mysql`, `mbstring`, `dom`, `xml`, `curl`, `zip`, `bcmath`, `intl`, `soap`, `gd`, `imagick`, `grpc`, and `redis`.
- Choose to install:
   - All PHP versions at once.
   - Only a specific PHP version.
- Switch the default active PHP version easily.
- Step-by-step progress indicator during installation.
- Automatic cleanup of unnecessary packages after setup.

---

## 🛠️ Requirements

- Ubuntu or Debian-based Linux distribution.
- `sudo` privileges (or root access).
- Internet connection (to fetch packages and repositories).

---

## 📥 Installation

1. **Clone this repository**:
   ```bash
   git clone https://github.com/CHUKzi/PHP-MU
   cd php-mu
