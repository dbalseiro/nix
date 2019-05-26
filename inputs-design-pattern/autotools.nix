pkgs: attrs:
  with pkgs;
  let 
    gcc = clang;
    binutils = clang.bintools.bintools_bin;
    defaultAttrs = {
      builder = "${bash}/bin/bash";
      args = [ ./builder.sh ];
      setup = ./setup.sh;
      baseInputs = [ gnutar gzip gnumake coreutils gawk gnused gnugrep gcc binutils findutils patchelf wget ];
      buildInputs = [];
      system = builtins.currentSystem;
    };
  in derivation (defaultAttrs // attrs)
