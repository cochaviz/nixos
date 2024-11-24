{ lib, pkgs, ... }:

let
  popOsKeybindings = import ./pop-os-keybindings.nix;
  customKeyBindings = import ./custom-keybindings.nix;
in
  {
    home.packages = with pkgs; [
        bibata-cursors
        wmctrl

        gnomeExtensions.pop-shell
        gnomeExtensions.blur-my-shell
        gnomeExtensions.just-perfection
	gnomeExtensions.rounded-window-corners-reborn
    ];

    gtk.iconTheme.name = "Tela";
    gtk.iconTheme.package = pkgs.tela-icon-theme;

    dconf.settings = lib.recursiveUpdate
      customKeyBindings popOsKeybindings;
  }
