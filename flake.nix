{
  description = "Sholt0r's Flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-darwin.follows = "nix-darwin";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager, ... }: {

    nixosConfigurations = {
      sim-bastion = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/sim-bastion/config.nix

          home-manager.nixosModules.home-manager
          {
            users.users.sholtor = {
              name = "sholtor";
              home = "/home/sholtor";
            };
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.jstaples = import ./home/sim-bastion/home.nix;
            };
          }

        ];
      };
    };

    darwinConfigurations = {
      mba = nix-darwin.lib.darwinSystem {
        system = "arm64-darwin";
        modules = [ 
          ./systems/mba/config.nix
          ./systems/mba/brew.nix

          home-manager.darwinModules.home-manager
          {
            users.users.jstaples = {
              name = "jstaples";
              home = "/Users/jstaples";
            };
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.jstaples = import ./home/mba/home.nix;
            };
          }

          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "jstaples";
            };
          }

        ];
      };
      darwinPackages = self.darwinConfigurations."mba".pkgs;
    };
  };
}
