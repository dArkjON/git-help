# electrum-help
https://github.com/dalijolijo/electrum/tree/master/contrib/build-wine/docker


## Only for first time
### Install docker
```sh
sudo curl -sSL https://get.docker.com | sh
```

### Build image "electrum-wine-builder-img"
```sh
cd electrum
sudo docker build --no-cache -t electrum-wine-builder-img contrib/build-wine/docker
```

## For every new version

### Update/clone Git code
```sh
git clone -b '3.2.3' https://github.com/dalijolijo/electrum.git
```

### Build Windows binaries
```sh
screen
cd electrum
sudo docker run \
    --name electrum-wine-builder-cont \
    -v $PWD:/opt/wine64/drive_c/electrum \
    --rm \
    --workdir /opt/wine64/drive_c/electrum/contrib/build-wine \
    electrum-wine-builder-img \
    ./build.sh
```
	
### Find binaries
The generated binaries are in ./contrib/build-wine/dist.

