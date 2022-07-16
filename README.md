# mcs-server

Just a WIP repo in helping with automating minecraft hosting and server creation.

> Take note, this is not entirely to be used by other people, you are responsible for whatever happens to your server using this repositories contents.


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
sudo systemctl start minecraft@stoneblock
```

- To soft-restart the server.
```bash
sudo systemctl restart minecraft@stoneblock-3
```

- Remove service.
```bash
sudo systemctl disable minecraft@stoneblock-3
```
