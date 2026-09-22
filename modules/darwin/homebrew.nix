# Global apps
_: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
      extraFlags = [
        "--force-cleanup"
      ];
    };
    # brews = [
    #   "mas" # Mac App Store CLI
    # ];
    casks = [
      "audacity"
      "blender"
      "discord"
      "firefox"
      "ghostty"
      "gimp"
      # "godot"  # Not making any games right now
      "keepassxc"
      "microsoft-teams"
      "nextcloud"
      "obsidian"
      "orion"
      "signal"
      # "slack"
      "spotify"
      "telegram"
      # "tigervnc"  # Luckily I only need SSH for remote stuff
      "visual-studio-code"
      "vlc"
      # "xquartz"  # Luckily I don't have to run any cursed X11 apps remotely
      # "yacreader"  # Great manga reader!
      "zed"
    ];
    # masApps = {
    #   "Amphetamine" = 937984704;
    # };
  };
}
