FROM library/ubuntu:18.04
RUN apt update && apt install -y gdb curl lib32gcc1 && useradd -m steam
USER steam
RUN mkdir /home/steam/Steam && \
  cd /home/steam/Steam && \
  curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - && \
  cd /home/steam/Steam && \
  ./steamcmd.sh +login anonymous +force_install_dir /home/steam/pavlovserver +app_update 622970 +exit && \
  chmod +x ~/pavlovserver/PavlovServer.sh

CMD cd /home/steam/pavlovserver && ./PavlovServer.sh
