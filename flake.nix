{
  description = "NeoVim development Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "neovim-config";
          src = ./.;
          buildInputs = [
            pkgs.neovim
          ];
          installPhase = ''
            mkdir -p $out/etc/xdg/nvim
            cp -r * $out/etc/xdg/nvim
          '';
        };
        apps.default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/nvim";
        };
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            nixpkgs-fmt
            nil
            lua-language-server
            stylua
          ];
        };
      });
}
