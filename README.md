# CSSserver

## Example docker run
```
docker run -d --rm \
--name cssserver \
-p 27016:27016/tcp \
-p 27016:27016/udp \
-e MAP="cs_assault" \
-e MAXPLAYERS="16" \
-v $PWD/cssserver.cfg:/home/cssserver/serverfiles/cstrike/cfg/cssserver.cfg \
ghcr.io/stenstromen/cssserver:latest
```