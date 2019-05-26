{
  packageOverrides = pkgs: {
    graphviz = pkgs.graphviz.override { xlib = null; };
  };
}
