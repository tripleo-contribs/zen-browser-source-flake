# Zen Browser Flake

> [!WARNING]
> This repo has been archived. Feel free to fork it if you need to build Zen
> Browser from source using Nix, but those who are just looking to use the
> browser should use <https://github.com/youwen5/zen-browser-flake>, which does
> not require building from source and patches upstream binaries for Nix.

A flake for Zen Browser that builds it from source. Supports `aarch64-linux`
and `x86_64-linux`. Binary cache included.

```sh
nix build --extra-experimental-features nix-command --extra-experimental-features flakes --accept-flake-config github:youwen5/zen-browser-source-flake
```

## Binary caching

CircleCI arm64 runners and GitHub actions x86_64 runners automatically build
and push binary artifacts to `zen-browser.cachix.org`. If you accept the risk
of downloading opaque binaries from an untrusted individual (namely, me), you
can trust the binary caches and avoid compiling from source. If you want to
compile it yourself, then omit `--accept-flake-config` and do not trust the
cache when prompted by Nix. This will build the entire browser from source
(binary artifacts available in `cache.nixos.org` will still be used).
