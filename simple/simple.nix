with (import <nixpkgs> {});
derivation {
  inherit gcc coreutils;
  binutils = binutils-unwrapped;
  name = "simple";
  builder = "${bash}/bin/bash";
  args = [ ./simple_builder.sh ];
  src = ./simple.c ;
  system = builtins.currentSystem;
}
