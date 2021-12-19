{
  inputs = {
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = {nixpkgs, home-manager, ...} @inputs: rec {
    nixosConfigurations = {
      nixos-dev1 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
          ./hosts/nixos-dev1/configuration.nix 
          home-manager.nixosModules.home-manager
          ({pkgs, ...}: {
            nixpkgs.overlays = [ overlays.vimPlugins ]; 
          })
        ];
        specialArgs = { inherit inputs; };
      };
    };

    overlays = import ./overlays;

    devShells = {
      x86_64-linux = import ./shells { pkgs = nixpkgs.legacyPackages.x86_64-linux; };
    };
  };
}
