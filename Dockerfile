FROM ubuntu:22.04
ENV MAP="de_dust"
ENV MAXPLAYERS="22"
RUN $(echo steam steam/question select "I AGREE" | debconf-set-selections) && \
$(echo steam steam/license note '' | debconf-set-selections) && \
dpkg --add-architecture i386 && \
apt-get update && \
apt-get install -y lib32gcc-s1 \
curl \ 
lib32stdc++6 \
ca-certificates \ 
steamcmd && \
adduser --disabled-password --gecos "" cssserver
USER cssserver
RUN mkdir ~/data && \
/usr/games/steamcmd +login anonymous +force_install_dir ~/data +app_update 232330 +quit && \
mkdir /home/cssserver/.steam/sdk32 && \
cp /home/cssserver/.local/share/Steam/steamcmd/linux32/steamclient.so /home/cssserver/.steam/sdk32/
EXPOSE 27015/udp
EXPOSE 27015/tcp
WORKDIR /home/cssserver/data
CMD ./srcds_run -game cstrike \
-strictportbind \
+ip 0.0.0.0 \
-port 27015 \
+clientport 27005 \
+map $MAP \
+servercfgfile csserver.cfg \
-maxplayers $MAXPLAYERS