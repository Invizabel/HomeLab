import os

os.system("sudo apt update && sudo apt install curl default-jre -y")

# log4shell flaw
os.system("mkdir Minecraft")
os.chdir("Minecraft")
os.system("curl -o server.jar https://launcher.mojang.com/v1/objects/952438ac4e01b4d115c5fc38f891710c4941df29/server.jar")
os.system("java -jar server.jar")
