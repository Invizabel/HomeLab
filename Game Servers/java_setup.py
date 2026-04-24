import os
import requests
import shutil
import subprocess

users_os = "unix"
if os.name == "nt":
    users_os = "windows"

version = input("version: ")
found_version = False
content = requests.get("https://launchermeta.mojang.com/mc/game/version_manifest.json", headers={"User-Agent": "Mozilla/5.0 (Minecraft Server Manager)"}, timeout=10).json()
for i in content["versions"]:
    if i["id"] == version:
        found_version = True
        content = requests.get(i["url"], headers={"User-Agent": "Mozilla/5.0 (Minecraft Server Manager)"}, timeout=10).json()
        if users_os == "windows":
            print(f"Found version {version} {i['type']} @ {content['downloads']['windows_server']['url']}.")
            content = requests.get(content['downloads']['windows_server']['url'], headers={"User-Agent": "Mozilla/5.0 (Minecraft Server Manager)"}, timeout=10).content
            with open(f"server.jar","wb") as file:
                file.write(content)
        else: 
            home_directory = "/".join(os.getcwd().split("/")[:3])
            
            print(f"Found version {version} {i['type']} @ {content['downloads']['server']['url']}.")
            print(f"Downloading: {version}.")
            
            content = requests.get(content['downloads']['server']['url'], headers={"User-Agent": "Mozilla/5.0 (Minecraft Server Manager)"}, timeout=10).content
            with open(f"{home_directory}/server.jar","wb") as file:
                file.write(content)
            
            if os.path.exists(f"{home_directory}/server.jar") and os.path.getsize(f"{home_directory}/server.jar") > 1024:
                print("Download successful.")
                devnull = open(os.devnull,"w")
                retval = subprocess.call(["dpkg","-s","default-jre"],stdout=devnull,stderr=subprocess.STDOUT)
                devnull.close()
                if retval == 0:
                    print("Package default-jre is installed.")
                    
                    os.chdir(home_directory)
                    print("Creating folder for the server to live in.")
                    if not os.path.exists("Server"):
                        os.mkdir("Server")
                    os.chdir(f"{home_directory}/Server")
                    if not os.path.exists(version):
                        os.mkdir(version)
                    os.chdir(home_directory)
                    
                    shutil.copy(f"server.jar", f"Server/{version}/server.jar")
                    
                    print("Accepting EULA.")
                    with open(f"{home_directory}/Server/{version}/eula.txt", "w") as file:
                        file.write("eula=true")

                    os.chdir(f"{home_directory}/Server/{version}")
                    print("Running server.")
                    os.system(f"java -jar server.jar --nogui")

                else:
                    print("Package default-jre not installed. Please install it.")
            else:
                print("Download failed.")
            

if not found_version:
    print(f"Unknown version {version}")
