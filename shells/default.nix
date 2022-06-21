{pkgs}:
{
  rust = pkgs.mkShell {
    nativeBuildInputs = [
      pkgs.cargo
      pkgs.rustc
      pkgs.clippy
      pkgs.rustfmt
      pkgs.gcc
    ];
    RUST_SRC_PATH = pkgs.rust.packages.stable.rustPlatform.rustLibSrc;
  };

  lfs = (pkgs.buildFHSUserEnv {
    name = "lfs-build";
    targetPkgs = pkgs: with pkgs; [
      binutils
      bison
      coreutils
      diffutils
      findutils
      gawk
      gcc
      gzip
      linux
      gnum4
      gnumake
      gnupatch
      perl
      python38
      gnused
      gnutar
      texinfo
      xz
      wget
    ];
    profile = ''
      export PS1="\n\[\033[1;36m\](lfs shell) [\u@\h:\w]\$\[\033[0m\] "
      export LFS=/mnt/lfs
      set +h
      export LFS_TGT=$(uname -m)-lfs-linux-gnu
      export PATH=$LFS/tools/bin:$PATH
      export CONFIG_SITE=$LFS/usr/share/config.site
      export LFS_SRC=$LFS/sources

      unset CONFIG_SHELL GDK_PIXBUF_MODULE_FILE GTK_PATH KDEDIRS MOZ_PLUGIN_PATH QTWEBKIT_PLUGIN_PATH QT_PLUGIN_PATH SHELL shell
    '';
  }).env;
}
