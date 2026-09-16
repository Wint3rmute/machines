{
  description = "Wint3rmute's Machines";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.darwin.follows = "nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
      agenix,
    }:
    {
      formatter = {
        aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt-tree;
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
      };

      darwinConfigurations."air" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs self; };
        modules = [
          home-manager.darwinModules.home-manager
          agenix.darwinModules.default
          ./modules/shared/agenix.nix
          ./modules/darwin/configuration.nix
          ./modules/darwin/hosts.nix
          ./modules/darwin/global_packages.nix
          ./modules/darwin/macos.nix
          ./modules/darwin/homebrew.nix
          ./modules/darwin/wireguard.nix
        ];
      };

      nixosConfigurations."asus" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          home-manager.nixosModules.home-manager
          agenix.nixosModules.default
          ./modules/shared/agenix.nix
          ./modules/asus/configuration.nix
          ./modules/asus/hardware.nix
          ./modules/asus/wireguard.nix
          ./modules/asus/jamulus.nix
          ./modules/asus/openconnect.nix
          # ./modules/asus/llm.nix
          # ./modules/asus/dms.nix
        ];
      };
    };
}
