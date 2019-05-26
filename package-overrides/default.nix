let 
  lib = import ./lib.nix;
  nixpkgs = import <nixpkgs> {};
  allpkgs = nixpkgs // pkgs;
  callPackage = path: overrides:
    let f = import path;
    in f ((builtins.intersectAttrs (builtins.functionArgs f) allpkgs) // overrides);
  pkgs = with nixpkgs; {
    mkDerivation = import ./autotools.nix nixpkgs;
    hello = callPackage ./hello.nix {};
    graphviz = lib.makeOverridable (callPackage ./graphviz.nix) {};
    graphviz-core = callPackage ./graphviz.nix { gdSupport = false; };
    graphviz-png = graphviz.override { libjpeg = libpng; };
  };
in pkgs
