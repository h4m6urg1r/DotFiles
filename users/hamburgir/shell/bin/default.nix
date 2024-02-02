{ stdenv, ... }: let
	# restartEWW = import ./ewwRestartScript.nix { inherit pkgs; };
	installFromFile = name: source: stdenv.mkDerivation {
		name = name;
		src = source;
		installPhase = "mkdir -p $out/bin && cp $src $out/bin/";
	};
in {
	home.packages = [
		# restartEWW
		(installFromFile "volume" ./volume)
	];
}
