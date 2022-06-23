{ name, sshkeys ? (import ../data/sshkeys.nix).all }:
{ pkgs, ...}: {
  users.users.${name} = {
    isNormalUser = true;
    home = "/home/${name}";
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = sshkeys;
  };
}
