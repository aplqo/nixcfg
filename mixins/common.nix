{config, pkgs, ...}:
{
  config = {
    boot.tmpOnTmpfs = true;

    nix = {
      package = pkgs.nixFlakes;
      extraOptions = ''
        experimental-features = nix-command flakes
      '';
    };
    
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
}
