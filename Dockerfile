FROM ghcr.io/void-linux/void-musl

RUN xbps-install -S -y
RUN xbps-install -u -y xbps
RUN xbps-install -Sy -y
RUN xbps-install -y make
RUN xbps-install -y gcc
RUN xbps-install -y pkg-config
RUN xbps-install -y cmake
RUN xbps-install -y git
RUN xbps-install -y bash
RUN xbps-install -y base-devel
RUN xbps-install -y util-linux
RUN xbps-install -y file
RUN xbps-install -y findutils
RUN xbps-install -y wget
RUN xbps-install -y mold
RUN xbps-install -y libXrender-devel
RUN xbps-install -y fontconfig-devel
RUN xbps-install -y bzip2-devel libpng-devel
RUN xbps-install -y libpng-devel

RUN git clone https://github.com/google/brotli
WORKDIR brotli
RUN mkdir build
WORKDIR build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=./installed -DBUILD_SHARED_LIBS=off ..
RUN cmake --build . --config Release --target install
ENV PKG_CONFIG_PATH=/brotli/build/installed/lib64/pkgconfig
WORKDIR /

RUN wget https://www.x.org/releases/individual/lib/libX11-1.8.7.tar.xz
RUN tar xf libX11-1.8.7.tar.xz
WORKDIR libX11-1.8.7
RUN ./configure CFLAGS="-ffunction-sections -fdata-sections -flto" --enable-ipv6 --enable-xlocaledir --without-xmlto --enable-static --enable-malloc0returnsnull --disable-thread-safety-constructor --prefix=/usr
RUN make install
WORKDIR /

RUN wget https://download-mirror.savannah.gnu.org/releases/freetype/freetype-2.13.2.tar.xz
RUN tar xf freetype-2.13.2.tar.xz
WORKDIR freetype-2.13.2
RUN ./configure CFLAGS="-ffunction-sections -fdata-sections -flto" --enable-freetype-config --prefix=/usr
RUN make install
WORKDIR /

RUN wget https://www.x.org/releases/individual/lib/libXft-2.3.8.tar.xz
RUN tar xf libXft-2.3.8.tar.xz
WORKDIR libXft-2.3.8
RUN ./configure CFLAGS="-ffunction-sections -fdata-sections -flto" --prefix=/usr
RUN make install
WORKDIR /
