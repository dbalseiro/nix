function exportPath() {
	for p in $@; do
		export PATH=$p/bin${PATH:+:}$PATH
	done
}

unset PATH

exportPath $buildInputs
exportPath $baseInputs

function unpackPhase() {
  local dir=${src%%.*}

  if [ ! -f $src ]; then
    wget $url/$src
  fi
  
  if [ -d $dir ]; then
    tar -xzf $src
  fi

  cd $dir
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
