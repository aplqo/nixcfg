rec {
  yubikey = {
    pgp = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDPt67LzwhTuEn26iv1tmo2Gl+/iW9D67acHqN8jAPzL6DdX3EltT2mC+W823QE9tzLZg6ErZ120FNFwO5qosekQd7UrXuou/m4qHnOKozDqg62dSi8HJTYb+792aOgNrCrtpXROZmy8/y/c7jC+NtFJ4YhYE9ZQxEj/uk5nF0Ap7bSUqLNdVw/ufhRvjFpK41fKBxFv0e5ay1wxeOQeGtI2bFwBPo2EPZxBmPenBg5XVdE3folWCjyt/sFlnPWcxmVTvpgK93c/YkJtHMnxX1f9rtiiSaQUn/LZuuAMOqzzQE1gPBTl62X4mQZv/WPGEGZ9c6BLSymQVblxjWPVYDqwhobBQ9DEAzdg7L15Yt6hdocelLEdfs7XOgWzmXQfLJtmPwFUORZrISsNfnUtepbrL/ICKXtE4tpfQGXDF1Ihw+KA8pJTbGGtEfIFqsbXrY6RIEz754hannFQrSmKCgXf9vOYSZWK/guw9GlNvGAKP5CLn8HTmugoZWBIRhrIV3n0gxSAQKe9AcxdFGDEGdOzKttzK84jsJB4ZC0i49deqVlGqLEqqkKPBnYObUfKn8PMnKG20Cz9sNeNzetLVOVwfqYcfYfzlwnXsmCbhdEzNkvtpSPlOAsEuRN3f5u4nZWkBV9Eol/mNJcIptIkl5qFkj/FPnHs6NZiJjWKWlnUw== cardno:000610636296";

    piv = "ecdsa-sha2-nistp384 AAAAE2VjZHNhLXNoYTItbmlzdHAzODQAAAAIbmlzdHAzODQAAABhBGx1d71vueiykgKjRFNonlRUE5I5yF98AIwi2AFT3VNrPpvmR5ihQYE4k4/RZx5lLynvv+nR9Igcc9UqJ9Qk+SJ3CIZuxqZYW7qg7CzreBteF6+Gr7edAX0G1ILpvbF6SQ== Public key for PIV Authentication";
  };


  nixos-laptop1 = {
    id_ed25519 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFMTo8TNxYRq83ZkQ4EKatdsKjaj8nbFZgCMQFEpE7YQ aplqo@nixos";
  };
  
  all = [ yubikey.pgp yubikey.piv nixos-laptop1 ];
}
