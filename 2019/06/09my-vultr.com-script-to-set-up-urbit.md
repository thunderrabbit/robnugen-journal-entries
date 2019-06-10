---
title: "My vultr.com script to set up Urbit"
tags: [ "urbit", "vultr" ]
author: Rob Nugen
date: 2019-06-09T10:10:15+09:00
---

##### 10:10 Sunday 09 June 2019 JST

I am finding [Vultr](https://www.vultr.com/?ref=8151506) easier to use than [Linode](https://www.linode.com/?r=e348d619c406fe9ca9f94f95a32557048afe6fb4), though I have
enjoyed using Linode in the past and do not have a track record with
Vultr yet.

Vultr allows me to easily create startup scripts; I see them in
Linode, but the click click GUI UX is not as easy for me.

Here is my script to set up swap space, create a passwordless sudoer
user, and it can just about set up Urbit as well.  I am going to test
it now.

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
    
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDhh1ULPA9zmSKNhK8+rqw9vIRZjLngHiNnwH7jV0fXwTYfTzIW22g4db0b52FZ5voAwSSET907qE2KomMuzmHtqGs9HjOuw+dNJy4+sgsCiDuQAo56Au413+FD5RrJOP29dL39Coh1N74wJTZ+TlUR8aDRK28JN9um8zZwEpTzShPDLR1PIzovN4Z9MUfM6gcDMzRZcHaHoDD3yIhWGMAXJ/QtWVHre4mLIx0nP30VUXhTncGNuwlKgMJSkggM2w7OfPLDLy2PLmrr9sPpt4okK8y+C1ZtNIW99YFbG7uGFPvPntQ3jNrpp34pds4TgjrYJ+CtEssqF50DDn/KZ98PUvP+mH37bUWwVbfu522xIC39D9ctbmBQVBpqsJjuCc5XB5Lv/2rb52LwDuulzJ50YhjYJyGr8zU2n9Vta2WUpBt6veDZ4VrUyu9lTrD18i6FyXkj0wZTEzkf/oOtoMuiqE6/V9wsDr6LJ1u10qv1120YvFA/svUSpn7JQ05CH5wbFHL+0Pby3+oFmRZ6zXlNoNYN+JGXQmIOP/Sq5R/dxBBS6sh3BZ8K1c9KjkapSfKB+lMNZ2nFGqPqcylKy2M9r1k47sdMWF1UHWhB47HVUJfLQPrQwrkmnr+X5PEs5WZQyxwjZwWacYCUQ09shdWuW/Uzlhl1unpd9YFNleSmWQ== thunderrabbit@elpasokon" >> /home/thunderrabbit/authorized_keys
    
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
