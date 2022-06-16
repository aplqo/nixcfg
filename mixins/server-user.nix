{ pkgs, ...}: {
  users.users.aplqo = {
    isNormalUser = true;
    home = "/home/aplqo";
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = (import ../data/sshkeys.nix).all;
  };
}
