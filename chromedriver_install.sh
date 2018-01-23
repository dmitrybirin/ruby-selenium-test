#!/bin/bash
# fixed and changed version of https://gist.github.com/diemol/635f450672b5bf80420d595ca0016d20

install_dir="/usr/local/bin"

if [ ! -f $install_dir/chromedriver ]; then
    if [[ $(uname) == "Darwin" ]]; then
        version=$(curl https://chromedriver.storage.googleapis.com/LATEST_RELEASE)
        url=https://chromedriver.storage.googleapis.com/$version/chromedriver_mac64.zip
    else
        echo "can't determine OS"
        exit 1
    fi
    curl -s -L "$url" | tar -xz
    chmod +x chromedriver
    echo "Moving ChromeDriver to $install_dir with sudo..."
    sudo mv chromedriver "$install_dir"
    echo "installed chromedriver binary in $install_dir"
else
echo "Chromedriver already installed in $install_dir"
fi


