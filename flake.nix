{
  description = "hydrogen";

  nixConfig = {
    substituters = [
      "https://cache.nixos.org"
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    home-manager,
    nix-darwin,
    nixpkgs
  }: let
    username = "ray";
    email = "me@rayhanadev.com";
    system = "aarch64-darwin";
    hostname = "hydrogen";
    specialArgs =
      inputs
      // {
        inherit username email hostname;
      };
  in {
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      inherit system specialArgs;
      modules = [
        ./modules/nix
        ./modules/system
        
        ./modules/apps
        ./modules/services

        ./modules/users

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.users.${username} = import ./home;
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations.${system}.pkgs;
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
