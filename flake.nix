{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
  };

  outputs = inputs: {
    packages =
      builtins.listToAttrs
        (map
          (system: let
            pkgs = import inputs.nixpkgs { inherit system; };
            pkgs_gtk2 = import inputs.nixpkgs {
              inherit system;
              overlays = [(final: prev: {
                gtk2 = pkgs.callPackage ./upstream/gtk2 { };
              })];
            };
            lib = pkgs.lib;
          in {
            name = system;
            value = (with pkgs_gtk2; rec {
              pidginPackages = lib.recurseIntoAttrs (
                callPackage ./pkgs/pidgin-plugins { }
              );
              inherit (pidginPackages) pidgin;
            }) // (with pkgs; rec {
              birb = callPackage ./pkgs3/birb.nix { };
              seagull = callPackage ./pkgs3/seagull.nix { };
              gplugin = callPackage ./pkgs3/gplugin.nix { };
              hasl = callPackage ./pkgs3/hasl.nix { };
              xeme = callPackage ./pkgs3/xeme.nix { inherit birb; };
              ibis = callPackage ./pkgs3/ibis.nix { inherit birb hasl; };
              pidgin3 = callPackage ./pkgs3 { inherit birb seagull gplugin hasl xeme ibis; };
            });
          })
          [
            "x86_64-linux"
            "aarch64-linux"
            "aarch64-darwin"
          ]);
  };
}
