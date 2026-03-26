{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dank-material-shell = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tokyonight = {
      url = "github:mrjones2014/tokyonight.nix";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      niri,
      dank-material-shell,
      tokyonight,
      ...
    }@inputs:
    {
      nixosConfigurations.home = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/home/configuration.nix

          niri.nixosModules.niri
          {
            nixpkgs.overlays = [
              niri.overlays.niri
            ];
          }

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.anton = {
              imports = [
                ./users/anton/home.nix
                dank-material-shell.homeModules.default
                dank-material-shell.homeModules.niri
                tokyonight.homeManagerModules.default
              ];
            };
          }
        ];
      };
    };
}
