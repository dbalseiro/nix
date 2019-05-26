{ mkDerivation } :
  mkDerivation {
    name = "hello";
    buildInputs = [];
    src = "hello-2.10.tar.gz";
    url = "http://ftp.gnu.org/gnu/hello";
  }
