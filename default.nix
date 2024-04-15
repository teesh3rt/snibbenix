{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
    name = "snibbetracker";
    src = pkgs.fetchFromGitHub {
	owner = "lundstroem";
	repo = "snibbetracker";
	rev = "8483d24a61703bcbab114673fae11ca4c5f0ef28";
	hash = "sha256-KxAq7UySXmGrr6LulOX53qEHUD2gIRAe3Qle1lDQbAw=";
    };

    patches = [ ./patch_makefile.patch ];

    buildPhase = ''
    cd res/linux/
    make snibbetracker
    '';

    installPhase = ''
    mkdir -p $out/bin
    cp snibbetracker $out/bin
    '';

    buildInputs = with pkgs; [ SDL2 ];
}
