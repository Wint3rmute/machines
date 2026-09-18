{ pkgs, ... }:
{
  home.packages =
    with pkgs;
    [
      ansible
      awscli2
      clang
      deadnix
      deno
      dig
      duf
      entr
      fastfetch
      fd
      ffmpeg
      fzf
      imagemagick
      jq
      just
      lilypond-unstable
      ncdu
      neovim
      nil
      nixd
      nixfmt
      nixfmt-tree
      nmap
      nodejs
      pre-commit
      ripgrep
      sd
      sshfs
      statix
      tinymist
      tldr
      tmux
      tree
      typescript-language-server
      typst
      uv
      yt-dlp
      zoxide
    ]
    ++ lib.optionals stdenv.hostPlatform.isDarwin [
      container
    ]
    ++ lib.optionals stdenv.hostPlatform.isLinux [
      bubblewrap
    ];
}
