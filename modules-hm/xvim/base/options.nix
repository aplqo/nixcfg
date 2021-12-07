{lib, name}:
with lib;
{
  enable = mkEnableOption name;

  configs = mkOption {
    type = types.listOf types.lines;
    default = [];
  };

  plugins = mkOption {
    type = types.listOf types.package;
    default = [];
  };

  extraPackages = mkOption {
    type = types.listOf types.package;
    default = [];
  };
}
