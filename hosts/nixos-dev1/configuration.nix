{inputs, ...}:
{
  imports = [
    "${inputs.nixpkgs}/nixos/modules/virtualisation/azure-common.nix"
    ../../mixins/common.nix
  ];

  users.users.aplqo = {
    isNormalUser = true;
    home = "/home/aplqo";
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = (import ../../data/sshkeys.nix).all;
  };

  home-manager.users.aplqo = {pkgs, ...}: {
    imports = [
      ../../mixins/git.nix
      ../../mixins/vim/vim.nix
    ];
  };

  services.openssh.passwordAuthentication = false;
  security.sudo.wheelNeedsPassword = false;
}
