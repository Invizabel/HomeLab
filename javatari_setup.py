import os

os.mkdir("emu")
os.chdir("emu")
os.system("git clone https://github.com/ppeccin/javatari.js")
os.system("sudo cp -r javatari.js/release/stable/5.0/standalone/* /var/www/html/javatari")
