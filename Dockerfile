FROM debian:11

COPY . .

RUN sudo apt-get update \
 && sudo apt-get install apt-transport-https \
 && sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' \
 && sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list' \
 && sudo apt-get update \
 && sudo apt-get install dart

RUN cd sp_shared && pub get
RUN cd sp_client && pub get
RUN cd sp_server && pub get

CMD ['./start.sh']