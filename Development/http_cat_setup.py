import os

os.system("sudo apt update")
os.system("sudo apt install git npm nodejs nginx")
os.system("sudo rm -r /var/www/html/*")
os.system("git clone https://github.com/httpcats/http.cat")
os.system("npm install next")
os.system("npx update browserlist-db@latest")
os.system("cd http.cat")
os.system("npm run build")
os.system("cd out")
os.system("sudo cp -r * /var/www/html")
os.system("sudo systemctl restart nginx")
