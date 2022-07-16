# mcs-server

Just a WIP repo in helping with automating minecraft hosting and server creation.

> Take note, this is not entirely to be used by other people, you are responsible for whatever happens to your server using this repositories contents.

## Overview
- *IMPORTANT*: This has only been tested using - [Debian 10 "Buster" Release](https://www.debian.org/News/2019/20190706).
- [minecraft@.service](https://github.com/the-ransum/mcs-setup/blob/main/minecraft%40.service) - The systemd unit file for being able to easily run headless services.
- [setup.sh](https://github.com/the-ransum/mcs-setup/blob/main/setup.sh) - Setup script that provides the commands necessary for the initial setup of the environment.
- [update-owner.sh](https://github.com/the-ransum/mcs-setup/blob/main/update-owner.sh) - Script for updating all file ownership to the valid runas instead of root or the user themselves. 


## Setup 

- **To be determined.**
- All server files will be located within the system account `minecraft`, so for example: `stoneblock-3` server files should be located `/home/minecraft/stoneblock-3/`.


## Starting

- Enable a unit service to be able to run on restart.
```bash
sudo systemctl enable minecraft@stoneblock-3
```

- To start the server.
```bash
sudo systemctl start minecraft@stoneblock-3
```

- To soft-restart the server.
```bash
sudo systemctl restart minecraft@stoneblock-3
```

- Remove service.
```bash
sudo systemctl disable minecraft@stoneblock-3
```
