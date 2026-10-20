_: {
  home = {
    username = "wint3rmute";
    homeDirectory = "/home/wint3rmute";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;

  programs.helix = {
    enable = true;
    settings = {
      theme = "base16_transparent";
      editor = {
        line-number = "relative";
        mouse = true;
        file-picker.hidden = false;
      };
      keys = {
        normal = {
          "0" = "goto_line_start";
          "C-r" = "redo";
          r = ":reflow";
          "}" = "goto_next_paragraph";
          "{" = "goto_prev_paragraph";
          space = {
            q = ":quit";
            "/" = "toggle_comments";
            s = "global_search";
          };
          "+".l = ":run-shell-command git pull -r";
        };
      };
    };
  };
}
