FROM ubuntu:22.04
ENV MAP="de_dust"
ENV MAXPLAYERS="22"
RUN $(echo steam steam/question select "I AGREE" | debconf-set-selections) && \
$(echo steam steam/license note '' | debconf-set-selections) && \
dpkg --add-architecture i386 && \
apt update && \
apt -y --fix-broken install \
curl \
wget \
file \
tar \
bzip2 \
gzip \
unzip \
bsdmainutils \
python3 \
util-linux \
ca-certificates \
binutils \
bc \
jq \
tmux \
netcat \
lib32gcc-s1 \
lib32stdc++6 \
libsdl2-2.0-0:i386 \
libtinfo5:i386 \
cpio \
distro-info \
xz-utils \
steamcmd && \
rm -rf /var/lib/apt/lists/* && \
adduser --disabled-password --gecos "" cssserver
USER cssserver
WORKDIR /home/cssserver
RUN wget -O linuxgsm.sh https://linuxgsm.sh && \
chmod +x linuxgsm.sh && \
bash linuxgsm.sh cssserver && \
./cssserver auto-install
RUN ./cssserver start
EXPOSE 27016/udp
EXPOSE 27016/tcp
WORKDIR /home/cssserver/serverfiles
CMD ./srcds_run -game cstrike \
-strictportbind \
+ip 0.0.0.0 \
-port 27016 \
+clientport 27005 \
+map $MAP \
+servercfgfile cssserver.cfg \
-maxplayers $MAXPLAYERS