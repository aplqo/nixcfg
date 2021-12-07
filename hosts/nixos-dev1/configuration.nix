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
      ../../mixins-hm/git.nix
      (import ../../mixins-hm/htop.nix { profile = "server"; })
      ../../modules-hm/xvim

      # vim packs
      (let
        eval = (import ../../modules-hm/xvim/lib.nix).evalPacks;
      in args: {
        imports = with (import ../../mixins-hm/vimPacks); [
          (eval "all" [ profiles.basic ])
        ];

        config = {
          modules.xvim = {
            vim.base.enable = true;
          };
        };
      })
    ];

  };

  services.openssh.passwordAuthentication = false;
  security.sudo.wheelNeedsPassword = false;
}
