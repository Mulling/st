# ST - Simpler Terminal

## Requirements:

In order to build ST you need docker.

## Building:

```shell
docker build . -t void
docker run -it -v .:/st/ -w /st void

PKG_CONFIG_PATH=/st/brotli/build/installed/lib64/pkgconfig make -B
```

## Credits:

Based on suckless's st which as based on Aurélien APTEL <aurelien dot aptel at gmail dot com> bt source code.
