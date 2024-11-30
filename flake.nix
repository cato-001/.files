{
  description = "Home Manager configuration of cato";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."cato" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./cato.home.nix

          ./config/nushell.nix
          ./config/tmux.nix
        ];
      };
    };
}
