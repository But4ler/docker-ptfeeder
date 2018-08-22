FROM trueosiris/ubuntu-dotnet:2.1.0

ENV TZ=Europe/Paris

# Stabke
#ARG FEEDER_REPOSITORY=PTFeeder
#ARG FEEDER_PREFIX_VERSION=pt-feeder
#ARG FEEDER_VERSION=1.6.0.855

# Beta
ARG FEEDER_REPOSITORY=ptfeeder-beta
ARG FEEDER_PREFIX_VERSION=pt-feeder-beta
ARG FEEDER_VERSION=1.7.0.1252

ENV FEEDER_REPOSITORY=${FEEDER_REPOSITORY}
ENV FEEDER_PREFIX_VERSION=${FEEDER_PREFIX_VERSION}
ENV FEEDER_VERSION=${FEEDER_VERSION}

RUN cd /opt
   &&  PROJECT_URL="https://github.com/mehtadone/$FEEDER_REPOSITORY"
   &&  ARTIFACT_URL="$PROJECT_URL/releases/download/${FEEDER_PREFIX_VERSION}-v$FEEDER_VERSION/pt-feeder-v$FEEDER_VERSION.zip"
   &&  wget -O feeder.zip $ARTIFACT_URL
   &&  unzip feeder.zip
   &&  rm -f *.zip
   &&  chmod +x pt-feeder/pt-feeder.dll
   &&  ls -la ./*

WORKDIR /opt/pt-feeder
VOLUME [/app/ptf]

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

