let
  nixpkgs = import <nixpkgs> {};
  inherit (nixpkgs) stdenv fetchurl which;
  actual = stdenv.mkDerivation {
    name = "hello-2.3";
    src = fetchurl {
      url = mirror://gnu/hello/hello-2.3.tar.bz2;
      sha256 = "0c7vijq8y68bpr7g6dh1gny0bff8qq81vnp4ch8pjzvg56wb3js1";
    };
  };
in stdenv.mkDerivation {
  name = "hello-wrapper";
  buildInputs = [ which actual ];
  unpackPhase = "true";
  installPhase = ''
    mkdir -p "$out/bin"
    echo "#! ${stdenv.shell}" >> "$out/bin/hello"
    echo "exec $(which hello)" >> "$out/bin/hello"
    chmod +x "$out/bin/hello"
  '';
}
