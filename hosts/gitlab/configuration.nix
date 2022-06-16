{ inputs, ...}: {
  imports = [
    ../../mixins/azure-common.nix
    ../../mixins/common.nix
    ../../mixins/server-user.nix
  ];

  services.gitlab = {
    enable = true;
    host = "20.24.93.201.nip.io";
    port = 80;
    https = true;
    initialRootPasswordFile = "/home/aplqo/password";
  };

  system.stateVersion = "22.05";
}
