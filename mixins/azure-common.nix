{ inputs, ...}: {
  imports = [
    "${inputs.nixpkgs}/nixos/modules/virtualisation/azure-common.nix"
  ];

  services.openssh.passwordAuthentication = false;
  security.sudo.wheelNeedsPassword = false;
}
