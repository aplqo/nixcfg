{
  inputs = {
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = {nixpkgs, home-manager, ...} @inputs: {
    nixosConfigurations = {
       nixos-dev1 = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         modules = [ 
           ./hosts/nixos-dev1/configuration.nix 
           home-manager.nixosModules.home-manager
         ];
         specialArgs = { inherit inputs; };
       };
     };
   };
 }
