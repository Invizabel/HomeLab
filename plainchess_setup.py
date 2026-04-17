import os

os.mkdir("chess")
os.chdir("chess")
os.system("sudo apt update && sudo apt install nginx git -y")
os.system("git clone https://github.com/TimWoelfle/PlainChess")
os.system("sudo cp -r PlainChess/* /var/www/html/")
