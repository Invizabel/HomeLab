import os

os.mkdir("app")
os.chdir("app")
os.system("sudo apt update && sudo apt install wget -y")
os.system("wget https://raw.githubusercontent.com/Invizabel/HomeLab/refs/heads/main/Assets/docker_setup.py")
os.system("python3 docker_setup.py")
os.system("wget https://raw.githubusercontent.com/Invizabel/HomeLab/refs/heads/main/Game%20Servers/java_latest.py")
os.system("wget https://github.com/Invizabel/HomeLab/blob/main/Docker/Java/dockerfile")
os.system("sudo docker build -t java:latest .")
