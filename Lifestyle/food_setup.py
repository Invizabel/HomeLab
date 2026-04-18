import os

os.system("sudo docker run -d --name=mealie --restart always -p 80:9000 ghcr.io/mealie-recipes/mealie:latest")
