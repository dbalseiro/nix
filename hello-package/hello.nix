let 
	pkgs = import <nixpkgs> {};
	mkDerivation = import ../autotools.nix pkgs;
in with pkgs;
mkDerivation {
  name = "hello";
  buildInputs = [ wget ];
  src = "hello-2.10.tar.gz";
  url = "http://ftp.gnu.org/gnu/hello";
}
