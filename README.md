# ST - Simpler Terminal

## Building:

```shell
docker build . -t void
docker run -it -v .:/st/ -w /st void

PKG_CONFIG_PATH=/st/brotli/build/installed/lib64/pkgconfig make -B
```
