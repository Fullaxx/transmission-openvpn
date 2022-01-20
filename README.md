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

## Optional Themes
[Soft Theme](https://git.eigenlab.org/sbiego/transmission-web-soft-theme) provided by [diesys](https://git.eigenlab.org/sbiego)
```
-e THEME='SOFTLIGHT'
-e THEME='SOFTDARK'
```

## Volume Options
Input: Drop your torrents in /data/watch/ \
Output: Your downloaded data will reside under /data/dl/ \
Logs: Your logs can be found here: /data/logs/
```
-v /data:/data/
```

## Connecting to Transmission
The transmission web server is running on port 9091 inside the container
```
-p 9091:9091
-p 172.17.0.1:9091:9091
```

## Run the image
```
docker run -d -p 172.17.0.1:9091:9091                      fullaxx/transmission-openvpn
docker run -d -p 172.17.0.1:9091:9091 -e THEME='SOFTLIGHT' fullaxx/transmission-openvpn
docker run -d -p 172.17.0.1:9091:9091 -e THEME='SOFTDARK'  fullaxx/transmission-openvpn
```
