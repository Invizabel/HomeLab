import os

os.system("sudo apt update && sudo apt install p7zip-full wget nginx git -y")

os.mkdir("emu")
os.chdir("emu")
os.system("wget https://buildbot.libretro.com/stable/1.22.2/emscripten/RetroArch.7z")
os.system("7z x RetroArch.7z")
os.system("sudo cp -r * /var/www/html/")
