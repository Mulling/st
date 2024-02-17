# st version
VERSION = 0.9.2

LINKAGE ?= --shared

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

INCS = `pkg-config --cflags x11        $(LINKAGE)` \
	   `pkg-config --cflags xft        $(LINKAGE)` \
       `pkg-config --cflags fontconfig $(LINKAGE)` \
       `pkg-config --cflags freetype2  $(LINKAGE)`
LIBS = `pkg-config --libs x11          $(LINKAGE)` \
	   `pkg-config --libs xft          $(LINKAGE)` \
       `pkg-config --libs fontconfig   $(LINKAGE)` \
       `pkg-config --libs freetype2    $(LINKAGE)`

# flags
STCPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600
STCFLAGS = $(INCS) $(STCPPFLAGS) $(CPPFLAGS) $(CFLAGS) -flto -O3 -ffunction-sections
STLDFLAGS = $(LIBS) $(LDFLAGS) $(CFLAGS) -flto -O3 -Wl,--gc-sections -Wl,--strip-all
