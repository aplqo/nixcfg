{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = {nixpkgs, home-manager, ...} @inputs: rec {
    nixosConfigurations = let
      mkSystem = name: system: nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/${name}/configuration.nix
          home-manager.nixosModules.home-manager
          ({pkgs, ...}: {
            nixpkgs.overlays = [ overlays.vimPlugins ];
          })
        ];
        specialArgs = { inherit inputs; };
      };
    in {
      nixos-dev1 = mkSystem "nixos-dev1" "x86_64-linux";

      nixos-laptop1 = mkSystem "nixos-laptop1" "x86_64-linux";
    };

    overlays = import ./overlays;

    devShells = {
      x86_64-linux = import ./shells { pkgs = nixpkgs.legacyPackages.x86_64-linux; };
    };
  };
}
