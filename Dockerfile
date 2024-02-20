FROM ghcr.io/void-linux/void-musl

RUN xbps-install -S -y
RUN xbps-install -u xbps -y
RUN xbps-install -Sy -y
RUN xbps-install make -y
RUN xbps-install gcc -y
RUN xbps-install libX11-devel -y
RUN xbps-install libXft-devel -y
RUN xbps-install pkg-config -y
RUN xbps-install cmake -y
RUN xbps-install git -y

RUN git clone https://github.com/google/brotli
WORKDIR brotli
RUN mkdir build
WORKDIR build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=./installed -DBUILD_SHARED_LIBS=off ..
RUN cmake --build . --config Release --target install

ENV PKG_CONFIG_PATH=/brotli/build/installed/lib64/pkgconfig
