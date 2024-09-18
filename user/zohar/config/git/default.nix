{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName  = "cochaviz";
    userEmail = "cochavi.zohar@protonmail.com";
  };
}
