{ pkgs, ...}: {
  programs.gpg = {
    enable = true;
  };
  home.file.".gnupg/gpg-agent.conf".text = ''
    pinentry-program ${pkgs.pinentry-qt}/bin/pinentry
  '';
}

