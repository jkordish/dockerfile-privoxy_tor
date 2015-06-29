# dockerfile-privoxy_tor
Dockerfile for creating a privoxy and tor proxy

osx
---
1. Install Homebrew

        $ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

2. Install Brew Cask

        $ brew install caskroom/cask/brew-cask

3. Install boot2docker

        $ brew cask install boot2docker

4. Initialize boot2docker:

        $ boot2docker init

        $ boot2docker up

5. Checkout and build docker image

        $ git clone https://github.com/jkordish/dockerfile-privoxy_tor.git

        $ cd dockerfile-privoxy_tor

        $ docker build -t tor .

6. Start up the tor/privoxy container

        $ docker run tor

7. Modify the boot2docker-vm to do port forwarding

        If boot2docker-vm is running
        $ VBoxManage controlvm "boot2docker-vm" natpf1 "tcp-port8118,tcp,,8118,,8118";

        If boot2docker-vm is **not** running
        $ VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port8118,tcp,,8118,,8118";
