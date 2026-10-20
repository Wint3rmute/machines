{ pkgs, ... }:
{
  programs.nushell = {
    enable = true;
    extraConfig = builtins.readFile ./nushell/config.nu;
  };

  home = {
    file.".config/zoxide.nu".text = builtins.readFile ./nushell/zoxide.nu;
    packages = with pkgs; [
      starship
      zoxide
    ];
  };
}
