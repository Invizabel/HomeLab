import os

os.system("sudo apt update && sudo apt install nginx wget -y")
os.mkdir("app")
os.chdir("app")
os.system("wget https://raw.githubusercontent.com/Invizabel/VolorSavanna/refs/heads/main/Volor%20Savanna/Web/index.html")
os.system("wget https://raw.githubusercontent.com/Invizabel/VolorSavanna/refs/heads/main/Volor%20Savanna/Web/script.js")
os.system("sudo cp index.html /var/www/html/")
os.system("sudo cp script.js /var/www/html/")
os.system("sudo systemctl restart nginx")
os.system("sudo systemctl reload nginx")
