---
title: "my Vultr startup script to start urbit"
tags: [ "vultr", "urbit", "cloud" ]
author: Rob Nugen
date: 2019-09-01T19:39:50+09:00
---

I have not used Vultr this month, but they charged me 2 yen.  Maybe
because I had this startup script on my account.   This script was
apparently last edited on June 15, 2019.

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
    apt install g++ -y
    apt install git -y
    apt install libcurl4-gnutls-dev -y
    apt install libgmp3-dev -y
    apt install libncurses5-dev -y
    apt install libsigsegv-dev -y
    apt install libssl-dev -y
    apt install make -y
    apt install openssl -y
    apt install pkg-config -y
    apt install python -y
    apt install python3 -y
    apt install python3-pip -y
    apt install python3-setuptools -y
    apt install zlib1g-dev -y
    apt install ninja-build -y
    
    
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
    
    
    # create wanbus user
    adduser --disabled-password --shell /bin/bash --gecos "Wan Bus" wanbus
    
    touch ~/050_created_wanbus
    
    # allow wanbus sudo access
    usermod -aG sudo wanbus
    
    echo "" >> /etc/sudoers
    echo "# allow wanbus passwordless sudo" >> /etc/sudoers
    echo "wanbus ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
    
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDhh1ULPA9zmSKNhK8+rqw9vIRZjLngHiNnwH7jV0fXwTYfTzIW22g4db0b52FZ5voAwSSET907qE2KomMuzmHtqGs9HjOuw+dNJy4+sgsCiDuQAo56Au413+FD5RrJOP29dL39Coh1N74wJTZ+TlUR8aDRK28JN9um8zZwEpTzShPDLR1PIzovN4Z9MUfM6gcDMzRZcHaHoDD3yIhWGMAXJ/QtWVHre4mLIx0nP30VUXhTncGNuwlKgMJSkggM2w7OfPLDLy2PLmrr9sPpt4okK8y+C1ZtNIW99YFbG7uGFPvPntQ3jNrpp34pds4TgjrYJ+CtEssqF50DDn/KZ98PUvP+mH37bUWwVbfu522xIC39D9ctbmBQVBpqsJjuCc5XB5Lv/2rb52LwDuulzJ50YhjYJyGr8zU2n9Vta2WUpBt6veDZ4VrUyu9lTrD18i6FyXkj0wZTEzkf/oOtoMuiqE6/V9wsDr6LJ1u10qv1120YvFA/svUSpn7JQ05CH5wbFHL+0Pby3+oFmRZ6zXlNoNYN+JGXQmIOP/Sq5R/dxBBS6sh3BZ8K1c9KjkapSfKB+lMNZ2nFGqPqcylKy2M9r1k47sdMWF1UHWhB47HVUJfLQPrQwrkmnr+X5PEs5WZQyxwjZwWacYCUQ09shdWuW/Uzlhl1unpd9YFNleSmWQ== thunderrabbit@silver-monkey" >> /home/wanbus/authorized_keys
    
    chown wanbus: /home/wanbus/authorized_keys
    chmod 600 /home/wanbus/authorized_keys
    
    echo "#!/bin/sh
    
    cd ~
    git clone https://github.com/thunderrabbit/new-DH-user-account.git
    cd new-DH-user-account
    ./setup.sh
    echo now removing go.sh since its job is done
    rm ~/go.sh
    echo now log off and see if you can log on as wanbus without password" >> /home/wanbus/go.sh
    chmod 755 /home/wanbus/go.sh
    chown wanbus: /home/wanbus/go.sh
    
    touch ~/060_created_gosh
    
    
    echo "#!/bin/sh
    
    python3-pip python3-setuptools zlib1g-dev ninja-build
    sudo -H pip3 install --upgrade pip
    sudo -H pip3 install meson
    
    git clone https://github.com/urbit/urbit
    cd urbit
    ./scripts/bootstrap
    ./scripts/build
    sudo ninja -C ./build/ install" >>  /home/wanbus/urbit.sh
    chmod 755 /home/wanbus/urbit.sh
    chown wanbus: /home/wanbus/urbit.sh
    
    touch ~/070_created_urbit.sh
    
    touch ~/999_done_script

Just in case I decide to use them, I can likely use the script with
small tweaks to get urbit running again.
