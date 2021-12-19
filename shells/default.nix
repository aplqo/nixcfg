{pkgs}:
{
  rust = pkgs.mkShell {
    nativeBuildInputs = [
      pkgs.cargo
      pkgs.rustc
      pkgs.gcc
    ];
    RUST_SRC_PATH = pkgs.rust.packages.stable.rustPlatform.rustLibSrc;
  };
}
