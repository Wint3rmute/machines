_: {
  imports = [
    ../shared/helix.nix
    ../shared/nushell.nix
  ];

  home = {
    username = "wint3rmute";
    homeDirectory = "/home/wint3rmute";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
