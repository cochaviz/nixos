{ ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
    '';

    shellAliases = {
      nv = "nvim .";
      editnix = "cd ~/.dotfiles/ && nv && cd -";
      devshell = "nix develop ~/.dotfiles/devshells/$argv[1]";
      usenix = "nix shell nixpkgs#$argv";
    };
  };

  # Disable the default command-not-found handler
  programs.command-not-found.enable = false;

  home.file.".config/fish/functions" = {
    enable = true;
    recursive = true;
    source = ./functions;
  };
}
