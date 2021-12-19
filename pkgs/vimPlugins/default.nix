{pkgs, lib, nodejs, stdenv, callPackage, vimUtils, fetchFromGitHub}:
{
  vim-moonfly-colors = vimUtils.buildVimPlugin {
    name = "vim-moonfly-colors";
    src = fetchFromGitHub {
      owner = "bluz71";
      repo = "vim-moonfly-colors";
      rev = "aa4ecf1301cbc70d9f7e2a7ff7729abdd1a64dd8";
      sha256 = "121n0v7m0z06rjm897bysp1bz4vw19w1v1pflgd5y0plvdfn2wh1";
    };
  };
} // callPackage ./coc-extensions {}
