FROM debian:11

COPY . /app

RUN apt-get update \
 && apt-get install -y wget apt-transport-https gnupg2 unzip

RUN cd /app && mkdir dart && wget https://storage.googleapis.com/dart-archive/channels/stable/release/1.24.3/sdk/dartsdk-linux-x64-release.zip && unzip dartsdk-linux-x64-release.zip -d dart
ENV PATH="${PATH}:/app/dart/dart-sdk/bin"

RUN cd /app/sp_shared && pub get
RUN cd /app/sp_client && pub get
RUN cd /app/sp_server && pub get

CMD ['./start.sh']