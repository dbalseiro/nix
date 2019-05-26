unset PATH

for p in $buildInputs $baseInputs; do
  if [ -d $p/bin ]; then
    export PATH=$p/bin${PATH:+:}$PATH
  fi

  if [ -d $p/include ]; then
    export NIX_CFLAGS_COMPILE="-I $p/include${NIX_CFLAGS_COMPILE:+ }$NIX_CFLAGS_COMPILE"
  fi

  if [ -d $p/lib ]; then
    export NIX_LDFLAGS="-rpath $p/lib -L $p/lib${NIX_LDFLAGS:+ }$NIX_LDFLAGS"
  fi
done

function unpackPhase() {
  local dir=`echo $src | sed s/\.tar\.gz$//`

  if [ ! -f $src ]; then
    wget --no-check-certificate $url/$src
  fi
  
  if [ ! -d $dir ]; then
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
