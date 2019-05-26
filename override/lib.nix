rec {
  makeOverridable = f: origargs:
    let origres = f origargs;
    in origres // { override = newargs: makeOverridable f (origargs // newargs); };
}
