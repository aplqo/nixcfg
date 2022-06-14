{ inputs, ...}: {
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

  home-manager.users.aplqo = { pkgs, ...}: {
    imports = [
      ../../mixins-hm/tmux.nix

      ../../modules-hm/xvim
      (let
        packs = import ../../mixins-hm/vimPacks;
      in { pkgs, ...}: {
        imports = [
          ((import ../../modules-hm/xvim/lib.nix).evalPacks {
            all = with packs; [
              profiles.basic
              languages.nix
            ];
          })
        ];

        config.modules.xvim.neovim.base.enable = true;
      })
    ];

    config = {
      home.packages = with pkgs; [
        azure-cli
        cacert
        azure-storage-azcopy
      ];
    };
  };

  services.openssh.passwordAuthentication = false;
  security.sudo.wheelNeedsPassword = false;
}
