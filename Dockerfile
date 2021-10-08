FROM debian:11

COPY . .

RUN apt-get update \
 && apt-get install -y wget apt-transport-https gnupg2  \
 && sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' \
 && sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list' \
 && apt-get update \
 && apt-get install -y dart

RUN cd sp_shared && dart pub get
RUN cd sp_client && dart pub get
RUN cd sp_server && dart pub get

CMD ['./start.sh']