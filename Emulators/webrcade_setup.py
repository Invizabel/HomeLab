import os

os.mkdir("emu")
os.chdir("emu")
os.system("sudo apt update && sudo apt install wget nginx -y")
os.system("wget https://raw.githubusercontent.com/Invizabel/HomeLab/refs/heads/main/HTML/arcade.html")
os.system("wget https://raw.githubusercontent.com/Invizabel/Scripts/refs/heads/main/Setup/docker_ubuntu.py")
os.system("python3 docker_ubuntu.py")
os.system("sudo docker run -d --name=webrcade -p 8080:80 -p 8443:443 --restart always webrcade/webrcade:latest")
os.system("sudo cp index.html /var/www/html/index.html")
