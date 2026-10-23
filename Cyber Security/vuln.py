import os

os.system("sudo apt update && sudo apt install curl default-jre screen -y")

# log4shell flaw
os.system("mkdir ~/Minecraft")
os.chdir(os.path.expanduser("~/Minecraft"))

# 1.7.10
os.system("curl -o server.jar https://launcher.mojang.com/v1/objects/952438ac4e01b4d115c5fc38f891710c4941df29/server.jar")
with open("eula.txt", "w") as file:
  file.write("eula=true")

# create persistance
os.system('(crontab -l ; echo @reboot /bin/bash -c "cd /home/$(whoami)/Minecraft && /usr/bin/screen -dmS java /usr/bin/java -jar server.jar --nogui") | crontab -')

# Reboot for changes to take affect
os.system("reboot")
