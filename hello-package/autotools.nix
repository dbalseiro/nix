pkgs: attrs:
  with pkgs;
  let 
    gcc = clang;
    binutils = clang.bintools.bintools_bin;
  in let defaultAttrs = {
    builder = "${bash}/bin/bash";
    baseInputs = [ gnutar gzip gnumake coreutils gawk gnused gnugrep gcc binutils findutils patchelf ];
    buildInputs = [];
    system = builtins.currentSystem;
  };
  in derivation (defaultAttrs // attrs)
