# st version
VERSION = 0.9.2

# Customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

# X11INC = /usr/X11R6/include
# X11LIB = /usr/X11R6/lib

PKG_CONFIG = pkg-config

# includes and libs
INCS = `$(PKG_CONFIG) --cflags x11        --static` \
	   `$(PKG_CONFIG) --cflags xft        --static` \
       `$(PKG_CONFIG) --cflags fontconfig --static` \
       `$(PKG_CONFIG) --cflags freetype2  --static`
LIBS = `$(PKG_CONFIG) --libs x11          --static` \
	   `$(PKG_CONFIG) --libs xft          --static` \
       `$(PKG_CONFIG) --libs fontconfig   --static` \
       `$(PKG_CONFIG) --libs freetype2    --static`

# flags
STCPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600
STCFLAGS = $(INCS) $(STCPPFLAGS) $(CPPFLAGS) $(CFLAGS) -static -flto -O3
STLDFLAGS = $(LIBS) $(LDFLAGS) -static -flto -O3

# OpenBSD:
#CPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600 -D_BSD_SOURCE
#LIBS = -L$(X11LIB) -lm -lX11 -lutil -lXft \
#       `$(PKG_CONFIG) --libs fontconfig` \
#       `$(PKG_CONFIG) --libs freetype2`
#MANPREFIX = ${PREFIX}/man

# compiler and linker
# CC = c99
