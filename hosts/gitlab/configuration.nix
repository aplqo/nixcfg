{ inputs, ...}: let
  host = "gitlab.20.239.156.230.nip.io";
in {
  imports = [
    ../../mixins/azure-common.nix
    ../../mixins/common.nix
    ../../mixins/server-user.nix
  ];

  services = {
    nginx = {
      enable = true;
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      virtualHosts.${host} = {
        enableACME = true;
        addSSL = true;
        locations."/".proxyPass = "http://unix:/run/gitlab/gitlab-workhorse.socket";
      };
    };

    gitlab = {
      enable = true;
      inherit host;
      port = 80;
      https = true;
      initialRootPasswordFile = "/var/keys/gitlab/root_password";
      databasePasswordFile = "/var/keys/gitlab/db_password";

      secrets = {
        secretFile = "/var/keys/gitlab/secret";
        dbFile = "/var/keys/gitlab/db";
        otpFile = "/var/keys/gitlab/otp";
        jwsFile = "/var/keys/gitlab/jws";
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  home-manager.users.aplqo = { pkgs, ...}: {
    imports = [
      ../../mixins-hm/tmux.nix
      (import ../../mixins-hm/htop.nix { profile = "server"; })
    ];
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "aplqo@outlook.com";
  };

  system.stateVersion = "22.05";
}
