{ mkDerivation, gdSupport ? true, gd, fontconfig, libjpeg, bzip2 } :
  mkDerivation {
    name = "graphviz";
    buildInputs = if gdSupport then [ gd fontconfig libjpeg bzip2 ] else [];
    src = "graphviz-2.38.0.tar.gz";
    url = "http://pkgs.fedoraproject.org/repo/pkgs/graphviz/graphviz-2.38.0.tar.gz/5b6a829b2ac94efcd5fa3c223ed6d3ae";
  }
