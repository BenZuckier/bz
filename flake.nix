{
  description = "bz's monorepo flake";
  inputs = {
    # keep-sorted start ignore_prefixes="
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };
  outputs =
    { self, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-linux"
      ];
      imports = [
        # keep-sorted start
        ./treefmt.nix
        inputs.treefmt-nix.flakeModule
        # keep-sorted end
      ];

    };
}
