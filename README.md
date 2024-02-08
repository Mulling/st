# ST - Simpler Terminal

## Requirements:

In order to build ST you need docker.

## Building:

```shell
docker build . -t void
docker run -it -v .:/st/ -w /st void

make
```

## Credits:

Based on suckless's `st` which as based on Aurélien APTEL `bt` source code.
