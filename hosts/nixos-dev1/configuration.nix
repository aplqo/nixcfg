{inputs, ...}:
{
  imports = [
    ../../mixins/common.nix
    ../../mixins/azure-common.nix
    ../../mixins/server-user.nix
  ];

  home-manager.users.aplqo = {pkgs, ...}: {
    imports = [
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
}
