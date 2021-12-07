{pkgs, lib}: 
with lib;
rec {
  jsonFormat = pkgs.formats.json {};
  opts = {
    enable = mkEnableOption "coc.nvim";

    extensions = mkOption {
      type = types.listOf types.package;
      default = [];
    };

    config = mkOption {
      type = jsonFormat.type;
      default = {};
    };
  };
}
