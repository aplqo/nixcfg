{pkgs, ...}: {
    imports = [
        ./dolphin.nix
        ./konsole.nix
        ./kwrite.nix
    ];
}
