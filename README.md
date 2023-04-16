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

## Random notes
```
./srcds_run -game cstrike \
-nointro \
-nojoy \
-noipx \
-heapsize 128000 \
-strictportbind \
+ip 0.0.0.0 \
-port 27016 \
+clientport 27005 \
+map cs_office \
+servercfgfile csserver.cfg \
-maxplayers 16 \
2> /dev/null
```