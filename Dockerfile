FROM ghcr.io/void-linux/void-musl

RUN xbps-install -S -y
RUN xbps-install -u xbps -y
RUN xbps-install -Su -y
RUN xbps-install make -y
RUN xbps-install gcc -y
RUN xbps-install wget -y
RUN xbps-install libX11-devel -y
RUN xbps-install libXft-devel -y
RUN xbps-install pkg-config -y
RUN xbps-install cmake -y
