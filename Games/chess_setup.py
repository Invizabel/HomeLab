import os

os.mkdir("app")
os.chdir("app")
os.system("sudo apt update && sudo apt install nginx git php-cli php-fpm php-common -y")
sudo.system('sudo systemctl restart "php$(php -r \'echo PHP_MAJOR_VERSION.".".PHP_MINOR_VERSION;\')-fpm"')
os.system("git clone https://github.com/TimWoelfle/PlainChess")
os.system("sudo cp -r PlainChess/* /var/www/html/")
os.system("PHP_VERSION=$(php -r 'echo PHP_MAJOR_VERSION.".".PHP_MINOR_VERSION;'); sudo tee -a /etc/nginx/sites-available/default >/dev/null <<EOF location ~ \.php$ { include snippets/fastcgi-php.conf; fastcgi_pass unix:/run/php/php${PHP_VERSION}-fpm.sock; } EOF")
