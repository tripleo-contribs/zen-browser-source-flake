{
  description = "Flake to build zen browser from source";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      perSystem =
        {
          pkgs,
          ...
        }:
        {
          packages = rec {
            zen-browser-unwrapped = pkgs.callPackage ./zen-browser-unwrapped.nix { };
            zen-browser = pkgs.callPackage ./zen-browser.nix { inherit zen-browser-unwrapped; };
            default = zen-browser;
          };
        };
    };

  nixConfig = {
    extra-substituters = [
      "zen-browser.cachix.org"
    ];
    extra-trusted-public-keys = [
      "zen-browser.cachix.org-1:z/QLGrEkiBYF/7zoHX1Hpuv0B26QrmbVBSy9yDD2tSs="
    ];
  };
}
