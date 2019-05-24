function exportPath() {
	for p in $@; do
		export PATH=$p/bin${PATH:+:}$PATH
	done
}

unset PATH

exportPath $buildInputs
exportPath $baseInputs

function unpackPhase() {
  wget $url/$src
  tar -xzf $src

  for d in *; do
    if [ -d $d ]; then
      cd $d
    fi
  done
}

function configurePhase() {
  ./configure --prefix=$out
}

function buildPhase() {
  make
}

function installPhase() {
  make install
}

function fixupPhase() {
  find $out -type f -exec patchelf --shrink-rpath '{}' \; -exec strip '{}' \; 2>/dev/null
}

function genericBuild() {
  unpackPhase
  configurePhase
  buildPhase
  installPhase
  fixupPhase
}
