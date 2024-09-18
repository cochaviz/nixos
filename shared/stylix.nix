{ pkgs, ... }:

{
  stylix = {
    enable = true;

    image = ../assets/wallpaper.jpg;
    polarity = "dark";

    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };  
  };
}
