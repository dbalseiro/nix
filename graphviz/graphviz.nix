let 
	pkgs = import <nixpkgs> {};
	mkDerivation = import ../autotools.nix pkgs;
in mkDerivation {
  name = "graphviz";
  buildInputs = with pkgs; [ wget gd fontconfig libpng libjpeg bzip2 zlib ];
  src = "graphviz-2.38.0.tar.gz";
  url = "http://pkgs.fedoraproject.org/repo/pkgs/graphviz/graphviz-2.38.0.tar.gz/5b6a829b2ac94efcd5fa3c223ed6d3ae";
}
