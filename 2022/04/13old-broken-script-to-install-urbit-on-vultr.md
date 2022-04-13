---
title: "OLD BROKEN script to install urbit on vultr"
tags: [ "broken", "backup", "history", "urbit" ]
author: Rob Nugen
date: 2022-04-13T16:12:08+09:00
draft: false
---

(written 16:12 Wednesday 13 April 2022 JST)

DO NOT CONSIDER USING THIS CODE FOR ANYTHING BUT BEMUSED HEAD SHAKING

This is a script I used on https://vultr.com to set up my server with
them.  That was some years ago, and it very likely is super outdated.

    #!/bin/sh
    
    # create swapspace
    
    apt update -y
    apt upgrade -y
    swapon --show
    fallocate -l 2G /swapfile
    chmod 600 /swapfile
    mkswap /swapfile
    swapon /swapfile
    nano /etc/fstab
    swapon --show
    
    touch ~/000_created_swap
    
    apt install emacs -y
    
    touch ~/010_installed_emacs
    
    # Install Urbit
    apt install g++ git libcurl4-gnutls-dev libgmp3-dev libncurses5-dev libsigsegv-dev libssl-dev make openssl pkg-config python python3 -y
    
    touch ~/020_install_python3
    
    pip3 install --upgrade pip
    pip3 install meson
    
    touch ~/030_installed_meson
    
    git clone https://github.com/urbit/urbit
    cd urbit
    ./scripts/bootstrap
    ./scripts/build
    ninja -C ./build/ install
    
    # end install urbit
    
    touch ~/040_installed_urbit
    
    
    # create thunderrabbit user
    adduser --disabled-password --shell /bin/bash --gecos "Wan Bus" thunderrabbit
    
    touch ~/050_created_thunderrabbit
    
    # allow thunderrabbit sudo access
    usermod -aG sudo thunderrabbit
    
    echo "" >> /etc/sudoers
    echo "# allow thunderrabbit passwordless sudo" >> /etc/sudoers
    echo "thunderrabbit ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
    
    echo "ssh-rsa AAAAREDACTEDWQ== thunderrabbit@elpasokon" >> /home/thunderrabbit/authorized_keys
    
    chown thunderrabbit: /home/thunderrabbit/authorized_keys
    chmod 600 /home/thunderrabbit/authorized_keys
    
    echo "#!/bin/sh
    
    cd ~
    git clone https://github.com/thunderrabbit/new-DH-user-account.git
    cd new-DH-user-account
    ./setup.sh
    echo now removing go.sh since its job is done
    rm ~/go.sh
    echo now log off and see if you can log on as thunderrabbit without password" >> /home/thunderrabbit/go.sh
    chmod 755 /home/thunderrabbit/go.sh
    chown thunderrabbit: /home/thunderrabbit/go.sh
    
    touch ~/060_created_gosh
    
    
    echo "#!/bin/sh
    
    python3-pip python3-setuptools zlib1g-dev ninja-build
    sudo -H pip3 install --upgrade pip
    sudo -H pip3 install meson
    
    git clone https://github.com/urbit/urbit
    cd urbit
    ./scripts/bootstrap
    ./scripts/build
    sudo ninja -C ./build/ install" >>  /home/thunderrabbit/urbit.sh
    chmod 755 /home/thunderrabbit/urbit.sh
    chown thunderrabbit: /home/thunderrabbit/urbit.sh
    
    touch ~/070_created_urbit.sh
    
    touch ~/999_done_script

IIrc, the `touch` points let me know how far the script was getting before
crashing.