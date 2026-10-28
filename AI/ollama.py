import os

os.mkdir("app")
os.chdir("app")
os.system("sudo apt update && sudo apt install wget -y")
os.system("wget https://raw.githubusercontent.com/Invizabel/HomeLab/refs/heads/main/Assets/docker_setup.py")
os.system("python3 docker_setup.py")
os.system("curl -fsSL https://ollama.com/install.sh | sh")
os.system("sudo docker run -d --network=host -v open-webui://app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/freshrss/freshrss:edge")
