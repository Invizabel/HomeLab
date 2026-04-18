import os

os.mkdir("app")
os.chdir("app")
os.system("sudo apt update && sudo apt install nginx git -y")
os.system("git clone https://github.com/TimWoelfle/PlainChess")
os.system("sudo cp -r PlainChess/* /var/www/html/")
