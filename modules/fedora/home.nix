{ pkgs, inputs, ... }: {
  imports = [
    ../shared/home_packages.nix
    ../shared/helix.nix
    ../shared/nushell.nix
  ];

  home = {
    username = "wint3rmute";
    homeDirectory = "/home/wint3rmute";
    stateVersion = "25.05";
    packages = [ inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default ];
  };

  age.identityPaths = [ "/home/wint3rmute/.ssh/id_ed25519" ];

  age.secrets.wg2 = {
    file = ../../secrets/wireguard.age;
    path = "/home/wint3rmute/.config/wireguard/wg2.conf";
    mode = "600";
    symlink = true;
  };

  programs.home-manager.enable = true;
}
