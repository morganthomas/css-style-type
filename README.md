# Snowman

☃️  ⟶ 🥔 ☃️

### We can make him tall. Or we can make him not so tall...

[Snowman](https://youtu.be/JQ1ZOFNBL68?t=8) is a seed project for [Shpadoinkle](https://gitlab.com/fresheyeball/Shpadoinkle/-/tree/master/#shpadoinkle).

[![Status](https://gitlab.com/fresheyeball/Shpadoinkle-snowman/badges/master/pipeline.svg)](https://gitlab.com/fresheyeball/Shpadoinkle-snowman/-/pipelines)

## Nix

This project is built with [Nix](https://nixos.org/).

### Install Nix

```bash
bash <(curl -L https://nixos.org/nix/install)
```

**Follow the instructions printed in your terminal**

## Cachix

Don't want to live with long build times? Cachix holds pre-built dependencies for this project.

### Install Cachix

```bash
nix-env -iA cachix -f https://cachix.org/api/v1/install
```

### Use the Cache

```bash
cachix use shpadoinkle
```

## Build the project

The included `default.nix` file has some arguments to customize your build. To build with GHC

```bash
nix-build
```

To build with GHCjs

```bash
nix-build --arg isJS true
```

## Develop

```
nix-shell
```

Will drop you into a dev shell with [Ghcid](https://github.com/ndmitchell/ghcid#ghcid----) and other common haskell development tools.

### TLDR

Get a ghcid server in one line

```bash
nix-shell --command "ghcid --command 'cabal repl'"
```

Get a hoogle server in one line

```bash
nix-shell --arg withHoogle true --command "hoogle serve"
```

### License

[![CC0](https://licensebuttons.net/p/zero/1.0/80x15.png)](http://creativecommons.org/publicdomain/zero/1.0/)

Isaac Shapira has waived all copyright and related or neighboring rights to Shpadoinkle Snowman.
This work is published from: United States
