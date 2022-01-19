# A small docker image running transmission with openvpn

## Base Docker Image
[Ubuntu](https://hub.docker.com/_/ubuntu) 20.04 (x64)

## Software
* [transmission](https://transmissionbt.com/) - An open-source bittorrent application
* [openvpn](https://openvpn.net/)

## Get the image from Docker Hub or build it locally
```
docker pull fullaxx/transmission-openvpn
docker build -t="fullaxx/transmission-openvpn" github.com/Fullaxx/transmission-openvpn
```

## Volume Options
Input: Drop your torrents in /data/watch/ \
Output: Your downloaded data will reside here in /data/dl/ \
Logs: Your logs can be found here: /data/logs/
```
-v /data:/data/
```
