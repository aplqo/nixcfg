rec {
  mkPack = mkPackFor null;

  mkPackFor = select: cfg: name: args@{lib, ...}: 
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

  evalPacks = select: packs: (args: {
    imports = map (m: m select) packs;
  });
}

