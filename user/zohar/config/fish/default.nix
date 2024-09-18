{ ... }:

{
    programs.fish = {
        enable = true;
        interactiveShellInit = ''
            set -g fish_greeting
        '';
    };

    home.file.".config/fish/functions" = {
        enable = true;
        recursive = true;
        source = ./functions;
    };
    home.file.".config/fish/conf.d" = {
        enable = true;
        recursive = true;
        source = ./conf.d;
    };
}
