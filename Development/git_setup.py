import os

os.mkdir("app")
os.chdir("app")
os.system("sudo apt update && sudo apt install wget -y")
os.system("wget https://raw.githubusercontent.com/Invizabel/HomeLab/refs/heads/main/Assets/docker_setup.py")
os.system("python3 docker_ubuntu.py")
os.system("sudo docker run -d --name=forgejo --restart always -p 80:3000 codeberg.org/forgejo/forgejo:15.0.0")
