docker run -d \
  --name=sonar \
  -e TZ=America/Monterrey \
  -e PUID=1000 \
  -e PGID=1000 \
  -v ~/docker/sonarr/data:/data \
  -v ~/docker/sonarr/config:/config \
  -p 8989:8989/tcp  \
  --restart unless-stopped \
  linuxserver/sonarr:0.6.1342


docker run -d  \
  --name=bazarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Monterrey \
  -v ~/Jellyfin/series:/tv \
  -v ~/docker/bazarr/config:/config \
  -p 6767:6767/tcp \
  --restart unless-stopped \
  linuxserver/bazarr:version-v1.0.1

docker run -d \
  --name=lidarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Monterrey \
  -p 8686:8686 \
  -v ~/docker/lidarr/config:/config \
  -v ~/docker/lidarr/downloads:/downloads \
  --restart unless-stopped \
  lscr.io/linuxserver/lidarr


docker run -d \
  --name=navidrome \
  --user $(id -u):$(id -g) \
  -v ~/Música/javier/rock:/music \
  -v ~/docker/navidrome/data:/data \
  -p 4533:4533 \
  --restart=unless-stopped \
  deluan/navidrome


docker run -d \
  --name=homer \
  -p 8085:8080 \
  -v ~/docker/homer/data:/www/assets \
  --restart=always \
  b4bz/homer:latest


docker run \
    -d \
    --name=airsonic \
    -u 1000:1000 \
    -e TZ=America/Monterrey \
    -e JAVA_OPTS=-Dserver.forward-headers-strategy=native \
    -p 4040:4040 \
    -p 4041:4041 \
    -v ~/Música/:/var/music \
    -v ~/docker/airsonic/podcasts:/var/podcasts \
    -v ~/docker/airsonic/playlists:/var/playlists \
    -v ~/docker/airsonic/data:/var/airsonic \
    --restart unless-stopped \
    airsonicadvanced/airsonic-advanced:latest
