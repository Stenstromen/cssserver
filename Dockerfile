FROM steamcmd/steamcmd:alpine as build
WORKDIR /
RUN mkdir /data
RUN steamcmd +login anonymous +force_install_dir /data +app_update 232330 +quit

FROM steamcmd/steamcmd:alpine
COPY --from=build /data /
CMD /data/srcds_run -game cstrike -secure +maxplayers 22 +map de_dust