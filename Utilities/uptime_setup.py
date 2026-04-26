import os

conf = """server {
    listen 80;
    server_name uptime.arpa;

    location / {
        proxy_pass         http://localhost:3001;
        proxy_http_version 1.1;
        proxy_set_header   Upgrade $http_upgrade;
        proxy_set_header   Connection "upgrade";
        proxy_set_header   Host $host;
        proxy_set_header   X-Real-IP $remote_addr;
        proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Proto $scheme;

        # Added WebSocket support
        proxy_set_header   Sec-WebSocket-Key $http_sec_websocket_key;
        proxy_set_header   Sec-WebSocket-Version $http_sec_websocket_version;
        proxy_set_header   Sec-WebSocket-Extensions $http_sec_websocket_extensions;

        # Improve performance of this reverse proxy
        proxy_buffering    off;
    }

    # Redirect HTTP to HTTPS if needed for encryption
    # Uncomment the following lines if you have SSL enabled
    # return 301 https://$host$request_uri;
}"""

with open("uptime-kuma.conf","w") as file:
    file.write(conf)

os.mkdir("app")
os.chdir("app")
os.system("sudo apt update")
os.system("sudo apt upgrade -y")
os.system("curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt install -y nodejs")
os.system("sudo apt update && sudo apt install -y git")
os.system("git clone https://github.com/louislam/uptime-kuma.git")
os.chdir("uptime-kuma")
os.system("npm run setup")
os.system("sudo npm install pm2 -g")
os.system("sudo pm2 install pm2-logrotate")
os.system("pm2 start server/server.js --name uptime-kuma")
os.system("sudo pm2 startup")
os.system("sudo apt install nginx -y")
os.system("sudo mv uptime-kuma.conf /etc/nginx/conf.d/uptime-kuma.conf")
os.system("sudo systemctl restart nginx")
