{
  description = "A very basic flake";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      rec {
        packages.default = pkgs.stdenv.mkDerivation
          {
            name = "gilice-site";
            src = ./.;
            nativeBuildInputs = with pkgs; [ zola ];
            buildPhase = ''
                  zola build
              						
            '';
            installPhase = ''
              							mv public $out'';
          };
      }
    );
}
