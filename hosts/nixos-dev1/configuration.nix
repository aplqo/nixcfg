{inputs, ...}:
{
  imports = [
    ../../mixins/common.nix
    ../../mixins/azure-common.nix
    (import ../../mixins/server-user.nix { name = "aplqo"; })
  ];

  system.stateVersion = "22.05";

  home-manager.users = let
    common = name: email: {pkgs, ...}: {
      imports = [
        (import ../../mixins-hm/git.nix name email)
        ../../mixins-hm/tmux.nix
        (import ../../mixins-hm/htop.nix { profile = "server"; })

      # vim packs
        ../../modules-hm/xvim
        (let
          packs = import ../../mixins-hm/vimPacks;
        in {pkgs, ...}: {
          imports = [ 
            ((import ../../modules-hm/xvim/lib.nix).evalPacks {
              all = with packs; [ 
                profiles.basic
                languages.nix 
                misc.lightline
              ];
            }) 
          ];

          config = {
            modules.xvim = {
              neovim.base.enable = true;
            };
          };
        })
      ];
    };
  in {
    aplqo = {
      imports = [
        (common "aplqo" "aplqo@outlook.com")
      ];

      config.home = {
        stateVersion = "22.05";
      };
    };
  };

}
