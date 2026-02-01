{
  description = "Snibbetracker for Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; }
    {
      perSystem = { self', pkgs, ... }: {
        packages.snibbetracker = pkgs.callPackage ./default.nix {};
        packages.default = self'.packages.snibbetracker;
      };

      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
    };
}
