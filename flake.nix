{
  description = "Zhili Nix packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      pkgsFor = system: import nixpkgs { inherit system; };
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = pkgsFor system;
        in
        {
          default = pkgs.buildEnv {
            name = "zhili-nix";

            paths = [
              pkgs.fish
              pkgs.git
              pkgs.gnumake

              pkgs.vim
              pkgs.neovim

              pkgs.ffmpeg-headless

              pkgs.curl
              pkgs.wget
              pkgs.unzip

              pkgs.xh
              pkgs.ripgrep
              pkgs.fzf
              pkgs.fd
              pkgs.jq
              pkgs.q
              pkgs.age
              pkgs.rage
              pkgs.tree

              pkgs.gh
              pkgs.ossutil

              pkgs.tailscale
              
              # Dev
              pkgs.mise
              pkgs.gcc
              pkgs.nodejs
              pkgs.go
              pkgs.gopls
              pkgs.gofumpt
              (nixpkgs.lib.lowPrio pkgs.gotools)
              pkgs.pgformatter
              pkgs.atlas
              pkgs.typescript-language-server
            ];

            meta = {
              description = "Zhili default Nix profile";
              license = nixpkgs.lib.licenses.mit;
              platforms = nixpkgs.lib.platforms.unix;
            };
          };
        }
      );
    };
}
