FROM debian:11

COPY . /app

RUN apt-get update \
 && apt-get install -y wget apt-transport-https gnupg2 unzip

RUN cd /app && wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_1.22.6-stable.tar.xz && tar xf flutter_linux_1.22.6-stable.tar.xz
ENV PATH="${PATH}:/app/flutter/bin"

RUN cd /app/sp_shared && pub get
RUN cd /app/sp_client && pub get
RUN cd /app/sp_server && pub get

CMD ['./start.sh']