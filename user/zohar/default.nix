{ config, pkgs, inputs, ... }:

let 
    user = "zohar";

    zenOverlay = final: prev: {
      zen-browser = inputs.zen-browser.packages.${pkgs.system}.default;
    };
in {
  # basic configuration
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # allow unfree
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);

  imports = [ 
    ./config
  ];

  # basic packages
  home.packages = with pkgs; [
    zen-browser
    keepassxc
    spotify

    vscode
    btop
    nil

    just

    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) 
  ];

  # Environment
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "zen";
    TERMINAL = "kitty";
  };

  # fonts
  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];

  # necessary for home-manager
  programs.home-manager.enable = true;
}
