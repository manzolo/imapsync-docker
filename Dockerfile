# Usa l'immagine ufficiale Debian Bookworm, che è la più recente e supportata.
FROM debian:bookworm-slim

LABEL description="Dockerfile for imapsync on Debian Bookworm"

# Imposta una variabile di ambiente per il non-interattivo apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Aggiorna i pacchetti e installa le dipendenze di imapsync
RUN apt update && apt install -y --no-install-recommends \
    libauthen-ntlm-perl \
    libcgi-pm-perl \
    libcrypt-openssl-rsa-perl \
    libdata-uniqid-perl \
    libencode-imaputf7-perl \
    libfile-copy-recursive-perl \
    libfile-tail-perl \
    libhttp-daemon-perl \
    libhttp-daemon-ssl-perl \
    libhttp-message-perl \
    libio-socket-inet6-perl \
    libio-socket-ssl-perl \
    libio-tee-perl \
    libhtml-parser-perl \
    libjson-webtoken-perl \
    libmail-imapclient-perl \
    libmodule-scandeps-perl \
    libnet-server-perl \
    libnet-dns-perl \
    libparse-recdescent-perl \
    libproc-processtable-perl \
    libreadonly-perl \
    libregexp-common-perl \
    libsys-meminfo-perl \
    libterm-readkey-perl \
    libtest-mockobject-perl \
    libunicode-string-perl \
    liburi-perl \
    libwww-perl \
    make \
    time \
    cpanminus \
    wget \
    procps \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# Scarica imapsync dal sito ufficiale, aggiungi permessi di esecuzione e copialo in /usr/local/bin
RUN wget -N https://imapsync.lamiral.info/imapsync \
    && chmod +x imapsync \
    && mv imapsync /usr/local/bin/

# Aggiorna il modulo IO::Socket::SSL come raccomandato per evitare errori SSL
RUN cpanm --test-only IO::Socket::SSL \
    && cpanm             IO::Socket::SSL

ENTRYPOINT ["imapsync"]
CMD ["--help"]
