import os

os.mkdir("app")
os.chdir("app")
os.system("sudo apt update && sudo apt install nginx git -y")
os.system("git clone https://github.com/ppeccin/javatari.js")
os.system("sudo cp -r javatari.js/release/stable/5.0/standalone/* /var/www/html/")
