import os

os.system("sudo apt update && sudo apt install wget nginx git -y")
os.system("wget https://raw.githubusercontent.com/Invizabel/Scripts/refs/heads/main/Setup/docker_ubuntu.py")
os.system("python3 docker_ubuntu.py")
os.system("git clone https://github.com/ppeccin/javatari.js")
os.system("git clone https://github.com/mitxela/swotGB")
os.system("sudo cp -r swotGB/gbjs.htm /var/www/html/swotgb/index.html")
os.system("sudo docker run -d --name=webrcade -p 8080:80 -p 8443:443 --restart always webrcade/webrcade:latest")
