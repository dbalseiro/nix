with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "hello";
  src = fetchurl {
    url = http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz;
		sha256 = "31e066137a962676e89f69d1b65382de95a7ef7d914b8cb956f41ea72e0f516b";
  };
}
