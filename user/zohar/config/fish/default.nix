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
