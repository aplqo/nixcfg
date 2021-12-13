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
      ../../mixins-hm/tmux.nix
      (import ../../mixins-hm/htop.nix { profile = "server"; })

      # vim packs
      ../../modules-hm/xvim
      (let
        packs = import ../../mixins-hm/vimPacks;
      in args: {
        imports = [ ((import ../../modules-hm/xvim/lib.nix).evalPacks {
          all = [ packs.profiles.basic ];
        }) ];

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
