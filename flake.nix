{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
    let 
      vars = {
        base = ./.;
        homeModules = ./home/modules;
        systemModules = ./system/modules;
        homeDotfiles = ./home/dotfiles;
        dotfiles = ./tocopy/dotfiles;
        tocopy = ./tocopy;
      };
    in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
    
      specialArgs = { inherit inputs vars; };
      modules = [
        ./system/configuration.nix
      	home-manager.nixosModules.home-manager {
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.users.hc = import ./home/home.nix;
	  home-manager.extraSpecialArgs = {inherit inputs vars;};
          home-manager.backupFileExtension = "backup";
        }
     ];
      
    };
  };
}
