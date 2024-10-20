{
  description = "My personal NixOS configuration";

  inputs = {
    # very important packages
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
      
    # other packages
    stylix.url = "github:danth/stylix";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    nixvim.url = "github:nix-community/nixvim";

    # TODO: this should be applied to each package, but I'm not sure
    # how to do this in a smart way...
    #
    # inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { 
    self, 
    nixpkgs, 
    home-manager, 
    stylix, 
    zen-browser, 
    nixvim, 
    ... 
  }@inputs:
  let 
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        (final: prev: {
          zen-browser = zen-browser.packages.${system}.default;
        })
      ];
    };

    # Helper function to create a NixOS configuration
    mkSystem = hostname: extraModules: nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ 
        (import ./system hostname)
        stylix.nixosModules.stylix
      ] ++ extraModules;
      specialArgs = { inherit inputs; };
    };

    # Helper function to create a Home Manager configuration
    mkHome = username: extraModules: home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ 
        ./user/${username}
        stylix.homeManagerModules.stylix
      ] ++ extraModules;
      extraSpecialArgs = { inherit inputs; };
    };

    # == SYSTEMS == 
    systems = [
      { 
	hostname = "appa"; 
	extraModules = [ 
	  ./system/modules/virtualization.nix
	  (import ./system/modules/syncthing.nix "zohar")
	]; 
      }
      { hostname = "vm"; extraModules = []; }
    ];
    # == USERS ==
    users = [
      { 
	username = "zohar"; 
	extraModules = [ ./shared/stylix.nix nixvim.homeManagerModules.nixvim ]; 
      }
    ];

  in {
    nixosConfigurations = builtins.listToAttrs (map
      (sys: {
        name = sys.hostname;
        value = mkSystem sys.hostname sys.extraModules;
      })
      systems);

    homeConfigurations = builtins.listToAttrs (map
      (user: {
        name = user.username;
        value = mkHome user.username user.extraModules;
      })
      users);
  };
}
