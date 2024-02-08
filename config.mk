# st version
VERSION = 0.9.2

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

INCS = `pkg-config --cflags x11        --static` \
	   `pkg-config --cflags xft        --static` \
       `pkg-config --cflags fontconfig --static` \
       `pkg-config --cflags freetype2  --static`
LIBS = `pkg-config --libs x11          --static` \
	   `pkg-config --libs xft          --static` \
       `pkg-config --libs fontconfig   --static` \
       `pkg-config --libs freetype2    --static`

# flags
STCPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600
STCFLAGS = $(INCS) $(STCPPFLAGS) $(CPPFLAGS) $(CFLAGS) -static -flto -O3 -ffunction-sections
STLDFLAGS = $(LIBS) $(LDFLAGS) -static -flto -O3 -Wl,--gc-sections
