{ pkgs, ... }:
{
  programs.nushell = {
    enable = true;
    configFile.text = builtins.readFile ../shared/nushell/config.nu;
    loadSessionVariables = true;
  };

  home.file.".config/zoxide.nu".text = builtins.readFile ../shared/nushell/zoxide.nu;

  home.packages = with pkgs; [
    starship
  ];
}
