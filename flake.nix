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
            lib = pkgs.lib;
          in with pkgs; {
            name = system;
            value = rec {
              pidginPackages = lib.recurseIntoAttrs (
                callPackage ./pkgs/pidgin-plugins { }
              );
              inherit (pidginPackages) pidgin;
            };
          })
          [
            "x86_64-linux"
            "aarch64-linux"
            "aarch64-darwin"
          ]);
  };
}
