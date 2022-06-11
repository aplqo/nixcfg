name: email: {pkgs, ...}:
{
  config = {
    programs.git = {
      enable = true;
      userName = name;
      userEmail = email;
    };
  };
}
