# dockerfile-privoxy_tor
Dockerfile for creating a privoxy proxy utilizing tor.

Not sure why other than I thought it would be a fun exercise. Perhaps it will
be useful for someone else.

osx boot2docker
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

        $ eval "$(boot2docker shellinit)"

5. Checkout and build docker image

        $ git clone https://github.com/jkordish/dockerfile-privoxy_tor.git

        $ cd dockerfile-privoxy_tor

        $ docker build -t tor .

6. Start up the tor/privoxy container

        $ docker run --name tor -p 8118:8118 -d tor

7. Test it out

        $ docker exec tor curl -skx localhost:8118 icanhazip.com

        $ curl -skx $(boot2docker ip):8118 icanhazip.com

8. Change browser proxy setting to the output of the command:

        $ echo $(boot2docker ip):8118

9. teardown once finished:

        $ docker kill tor

        $ docker rm tor

        $ boot2docker down

osx boot2docker-xhyve
---

Simliar to the boo2docker above but this uses the [xhyve](https://github.com/mist64/xhyve).

This particuliar project is via the awesome [boot2docker-xhyve](https://github.com/ailispaw/boot2docker-xhyve)

1. Install xhyve

        $ git clone https://github.com/mist64/xhyve
        $ cd xhyve
        $ make
        $ cp build/xhyve /usr/local/bin/ # You may need sudo.

2. Install boot2docker-xhyve

        $ git clone https://github.com/ailispaw/boot2docker-xhyve
        $ cd boot2docker-xhyve
        $ make

3. Boot it up

        $ sudo ./xhyverun.sh

4. Login using the user **docker**

5. Get the ip address of eth0

        $ ip a

5. Checkout and build docker image

        $ git clone https://github.com/jkordish/dockerfile-privoxy_tor.git

        $ cd dockerfile-privoxy_tor

        $ docker build -t tor .

6. Start up the tor/privoxy container

        $ docker run --name tor -p 8118:8118 -d tor

7.
