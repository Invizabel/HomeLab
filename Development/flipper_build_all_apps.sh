sudo apt update
sudo apt install python3-dev python3-venv gcc zlib1g-dev libpng-dev libjpeg-dev unzip zip -y

rm -rf flipper_venv
python3 -m venv flipper_venv
source flipper_venv/bin/activate

clear

rm -rf ~/flipper-application-catalog
rm -rf ~/qApps/

mkdir ~/qApps
mkdir ~/qApps/Bluetooth
mkdir ~/qApps/GPIO
mkdir ~/qApps/Games
mkdir ~/qApps/Infrared
mkdir ~/qApps/Media
mkdir ~/qApps/NFC
mkdir ~/qApps/RFID
mkdir ~/qApps/Sub-GHz
mkdir ~/qApps/Tools
mkdir ~/qApps/USB
mkdir ~/qApps/iButton

touch ~/qApps/errors.log

cd ~
git clone https://github.com/flipperdevices/flipper-application-catalog
pip install -r ~/flipper-application-catalog/tools/requirements.txt
cd ~/flipper-application-catalog/applications/Bluetooth

let "count=0"
find -follow | grep .yml | while IFS= read -r line; do
    cd ~/flipper-application-catalog/applications/Bluetooth
    rm -rf temp
    mkdir temp
    echo $line
    ((count++))
    if python3 -u ~/flipper-application-catalog/tools/bundle.py --nolint $line "bundle_$count.zip" 2>&1 | grep -qi 'error'; then echo $line >> ~/qApps/errors.log; continue; fi
    cp bundle_$count.zip temp
    cd temp
    unzip ~/flipper-application-catalog/applications/Bluetooth/temp/bundle_$count.zip
    cd ~/flipper-application-catalog/applications/Bluetooth/temp/code/
    python3 -m ufbt
    cp ~/flipper-application-catalog/applications/Bluetooth/temp/code/dist/*.fap ~/qApps/Bluetooth
    rm -rf code
done

cd ~/flipper-application-catalog/applications/GPIO

let "count=0"
find -follow | grep .yml | while IFS= read -r line; do
    cd ~/flipper-application-catalog/applications/GPIO
    rm -rf temp
    mkdir temp
    echo $line
    ((count++))
    if python3 -u ~/flipper-application-catalog/tools/bundle.py --nolint $line "bundle_$count.zip" 2>&1 | grep -qi 'error'; then echo $line >> ~/qApps/errors.log; continue; fi
    cp bundle_$count.zip temp
    cd temp
    unzip ~/flipper-application-catalog/applications/GPIO/temp/bundle_$count.zip
    cd ~/flipper-application-catalog/applications/GPIO/temp/code/
    python3 -m ufbt
    cp ~/flipper-application-catalog/applications/GPIO/temp/code/dist/*.fap ~/qApps/GPIO
    rm -rf code
done

cd ~/flipper-application-catalog/applications/Games

let "count=0"
find -follow | grep .yml | while IFS= read -r line; do
    cd ~/flipper-application-catalog/applications/Games
    rm -rf temp
    mkdir temp
    echo $line
    ((count++))
    if python3 -u ~/flipper-application-catalog/tools/bundle.py --nolint $line "bundle_$count.zip" 2>&1 | grep -qi 'error'; then echo $line >> ~/qApps/errors.log; continue; fi
    cp bundle_$count.zip temp
    cd temp
    unzip ~/flipper-application-catalog/applications/Games/temp/bundle_$count.zip
    cd ~/flipper-application-catalog/applications/Games/temp/code/
    python3 -m ufbt
    cp ~/flipper-application-catalog/applications/Games/temp/code/dist/*.fap ~/qApps/Games
    rm -rf code
done

cd ~/flipper-application-catalog/applications/Infrared

let "count=0"
find -follow | grep .yml | while IFS= read -r line; do
    cd ~/flipper-application-catalog/applications/Infrared
    rm -rf temp
    mkdir temp
    echo $line
    ((count++))
    if python3 -u ~/flipper-application-catalog/tools/bundle.py --nolint $line "bundle_$count.zip" 2>&1 | grep -qi 'error'; then echo $line >> ~/qApps/errors.log; continue; fi
    cp bundle_$count.zip temp
    cd temp
    unzip ~/flipper-application-catalog/applications/Infrared/temp/bundle_$count.zip
    cd ~/flipper-application-catalog/applications/Infrared/temp/code/
    python3 -m ufbt
    cp ~/flipper-application-catalog/applications/Infrared/temp/code/dist/*.fap ~/qApps/Infrared
    rm -rf code
done

cd ~/flipper-application-catalog/applications/Media

let "count=0"
find -follow | grep .yml | while IFS= read -r line; do
    cd ~/flipper-application-catalog/applications/Media
    rm -rf temp
    mkdir temp
    echo $line
    ((count++))
    if python3 -u ~/flipper-application-catalog/tools/bundle.py --nolint $line "bundle_$count.zip" 2>&1 | grep -qi 'error'; then echo $line >> ~/qApps/errors.log; continue; fi
    cp bundle_$count.zip temp
    cd temp
    unzip ~/flipper-application-catalog/applications/Media/temp/bundle_$count.zip
    cd ~/flipper-application-catalog/applications/Media/temp/code/
    python3 -m ufbt
    cp ~/flipper-application-catalog/applications/Media/temp/code/dist/*.fap ~/qApps/Media
    rm -rf code
done

cd ~/flipper-application-catalog/applications/NFC

let "count=0"
find -follow | grep .yml | while IFS= read -r line; do
    cd ~/flipper-application-catalog/applications/NFC
    rm -rf temp
    mkdir temp
    echo $line
    ((count++))
    if python3 -u ~/flipper-application-catalog/tools/bundle.py --nolint $line "bundle_$count.zip" 2>&1 | grep -qi 'error'; then echo $line >> ~/qApps/errors.log; continue; fi
    cp bundle_$count.zip temp
    cd temp
    unzip ~/flipper-application-catalog/applications/NFC/temp/bundle_$count.zip
    cd ~/flipper-application-catalog/applications/NFC/temp/code/
    python3 -m ufbt
    cp ~/flipper-application-catalog/applications/NFC/temp/code/dist/*.fap ~/qApps/NFC
    rm -rf code
done

cd ~/flipper-application-catalog/applications/RFID

let "count=0"
find -follow | grep .yml | while IFS= read -r line; do
    cd ~/flipper-application-catalog/applications/RFID
    rm -rf temp
    mkdir temp
    echo $line
    ((count++))
    if python3 -u ~/flipper-application-catalog/tools/bundle.py --nolint $line "bundle_$count.zip" 2>&1 | grep -qi 'error'; then echo $line >> ~/qApps/errors.log; continue; fi
    cp bundle_$count.zip temp
    cd temp
    unzip ~/flipper-application-catalog/applications/RFID/temp/bundle_$count.zip
    cd ~/flipper-application-catalog/applications/RFID/temp/code/
    python3 -m ufbt
    cp ~/flipper-application-catalog/applications/RFID/temp/code/dist/*.fap ~/qApps/RFID
    rm -rf code
done

cd ~/flipper-application-catalog/applications/Sub-GHz

let "count=0"
find -follow | grep .yml | while IFS= read -r line; do
    cd ~/flipper-application-catalog/applications/Sub-GHz
    rm -rf temp
    mkdir temp
    echo $line
    ((count++))
    if python3 -u ~/flipper-application-catalog/tools/bundle.py --nolint $line "bundle_$count.zip" 2>&1 | grep -qi 'error'; then echo $line >> ~/qApps/errors.log; continue; fi
    cp bundle_$count.zip temp
    cd temp
    unzip ~/flipper-application-catalog/applications/Sub-GHz/temp/bundle_$count.zip
    cd ~/flipper-application-catalog/applications/Sub-GHz/temp/code/
    python3 -m ufbt
    cp ~/flipper-application-catalog/applications/Sub-GHz/temp/code/dist/*.fap ~/qApps/Sub-GHz
    rm -rf code
done

cd ~/flipper-application-catalog/applications/Tools

let "count=0"
find -follow | grep .yml | while IFS= read -r line; do
    cd ~/flipper-application-catalog/applications/Tools
    rm -rf temp
    mkdir temp
    echo $line
    ((count++))
    if python3 -u ~/flipper-application-catalog/tools/bundle.py --nolint $line "bundle_$count.zip" 2>&1 | grep -qi 'error'; then echo $line >> ~/qApps/errors.log; continue; fi
    cp bundle_$count.zip temp
    cd temp
    unzip ~/flipper-application-catalog/applications/Tools/temp/bundle_$count.zip
    cd ~/flipper-application-catalog/applications/Tools/temp/code/
    python3 -m ufbt
    cp ~/flipper-application-catalog/applications/Tools/temp/code/dist/*.fap ~/qApps/Tools
    rm -rf code
done

cd ~/flipper-application-catalog/applications/USB

let "count=0"
find -follow | grep .yml | while IFS= read -r line; do
    cd ~/flipper-application-catalog/applications/USB
    rm -rf temp
    mkdir temp
    echo $line
    ((count++))
    if python3 -u ~/flipper-application-catalog/tools/bundle.py --nolint $line "bundle_$count.zip" 2>&1 | grep -qi 'error'; then echo $line >> ~/qApps/errors.log; continue; fi
    cp bundle_$count.zip temp
    cd temp
    unzip ~/flipper-application-catalog/applications/USB/temp/bundle_$count.zip
    cd ~/flipper-application-catalog/applications/USB/temp/code/
    python3 -m ufbt
    cp ~/flipper-application-catalog/applications/USB/temp/code/dist/*.fap ~/qApps/USB
    rm -rf code
done

cd ~/flipper-application-catalog/applications/iButton

let "count=0"
find -follow | grep .yml | while IFS= read -r line; do
    cd ~/flipper-application-catalog/applications/iButton
    rm -rf temp
    mkdir temp
    echo $line
    ((count++))
    if python3 -u ~/flipper-application-catalog/tools/bundle.py --nolint $line "bundle_$count.zip" 2>&1 | grep -qi 'error'; then echo $line >> ~/qApps/errors.log; continue; fi
    cp bundle_$count.zip temp
    cd temp
    unzip ~/flipper-application-catalog/applications/iButton/temp/bundle_$count.zip
    cd ~/flipper-application-catalog/applications/iButton/temp/code/
    python3 -m ufbt
    cp ~/flipper-application-catalog/applications/iButton/temp/code/dist/*.fap ~/qApps/iButton
    rm -rf code
done

rm -rf ~/flipper-application-catalog
rm -rf flipper_venv
