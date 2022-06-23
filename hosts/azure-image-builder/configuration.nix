{ inputs, ...}: {
  imports = [
    ../../mixins/azure-common.nix
    ../../mixins/common.nix
    (import ../../mixins/server-user.nix { name = "aplqo"; })
  ];

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
        jq
      ];
    };
  };
}
