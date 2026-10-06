import os

os.mkdir("app")
os.chdir("app")
os.system("sudo apt update")
os.system("sudo apt install git npm nodejs nginx -y")
os.system("sudo rm -r /var/www/html/*")
os.system("git clone https://github.com/httpcats/http.cat")
os.system("npx update browserlist-db@latest")
os.chdir("http.cat")
os.system("npm run build")
os.chdir("out")
os.system("sudo cp -r * /var/www/html")
os.system("sudo systemctl restart nginx")
