# ST - Simpler Terminal

## Building:

```shell
docker build . -t void
docker run -it -v .:/st/ -w /st void

make
```

## TODO:
- [ ] Fix shift up/down (shift selection in emacs) (upstream).
- [ ] Remove DEC test sequence when appropriate (upstream).
- [ ] Add diacritics support to `xdraws()` (upstream).
- [ ] **Dream** of switching to a suckless font drawing library (upstream).
- [ ] Make the font cache simpler (upstream).
- [ ] Cache glyphs.
- [ ] Build X11 dependencies with `--gc-sections`.
- [ ] Provide terminfo if missing.


## Credits:

Based on suckless's `st` which as based on Aurélien APTEL `bt` source code.
