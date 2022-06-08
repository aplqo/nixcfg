{config, pkgs, ...}:
{
  config = {
    boot.tmpOnTmpfs = true;

    nix = {
      package = pkgs.nixFlakes;
      autoOptimiseStore = true;
      extraOptions = ''
        experimental-features = nix-command flakes
      '';
    };
    
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };

    environment.systemPackages = with pkgs; [
      git
    ];
  };
}
