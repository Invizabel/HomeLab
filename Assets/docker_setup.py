import os

# Ubuntu Setup Only
os.system("sudo apt update")
os.system("sudo apt install ca-certificates curl")
os.system("sudo install -m 0755 -d /etc/apt/keyrings")
os.system("sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc")
os.system('echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo ${UBUNTU_CODENAME:-$VERSION_CODENAME}) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null')
os.system("sudo apt update")
os.system("sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin")
os.system("sudo systemctl start docker")
os.system("sudo systemctl enable docker")
os.system("sudo docker run hello-world")
