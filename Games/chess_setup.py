import os

os.mkdir("app")
os.chdir("app")
os.system("sudo apt update && sudo apt install nginx git php-cli php-fpm php-common -y")
sudo.system('sudo systemctl restart "php$(php -r \'echo PHP_MAJOR_VERSION.".".PHP_MINOR_VERSION;\')-fpm"')
os.system("git clone https://github.com/TimWoelfle/PlainChess")
os.system("sudo cp -r PlainChess/* /var/www/html/")
os.system("""PHP_VERSION=$(php -r 'echo PHP_MAJOR_VERSION.".".PHP_MINOR_VERSION;'); printf 'server {\\n    listen 80 default_server;\\n    listen [::]:80 default_server;\\n    root /var/www/html;\\n    index index.php index.html index.htm;\\n    server_name _;\\n\\n    location / {\\n        try_files $uri $uri/ =404;\\n    }\\n\\n    location ~ \\\\.php$ {\\n        include snippets/fastcgi-php.conf;\\n        fastcgi_pass unix:/run/php/php%s-fpm.sock;\\n    }\\n}\\n' "$PHP_VERSION" | sudo tee /etc/nginx/sites-enabled/default >/dev/null && sudo nginx -t && sudo systemctl restart nginx""")
