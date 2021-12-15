rec {
  mkPack = mkPackFor null;

  mkPackFor = select: cfg: name: args@{pkgs, lib, ...}: 
  assert select != null -> select == name;
  {
    modules.xvim.${name} = cfg args;
  };
  
  mkPackDep = { for ? null, config ? {...}: {}, depends? [] }:
    name: 
      assert for != null -> for == name;
      args@{pkgs, lib, ...}:
        lib.mkMerge (
          (map (m: m name args) depends) ++ 
          [ { modules.xvim.${name} = config args; } ]
        );

  evalPacks = cfg@{ all ? [], vim ? [], neovim ? [] }:  (args: {
    imports = let 
      eval = select: map (m: m select) cfg.${select} or [];
    in (eval "all") ++ (eval "vim") ++ (eval "neovim");
  });
}

