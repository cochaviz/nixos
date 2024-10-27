{ pkgs, ... }:

{
  stylix = {
    enable = true;

    image = ../assets/wallpaper.png;
    polarity = "dark";

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };  
  };
}
