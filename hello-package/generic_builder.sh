set -e

function exportPath() {
	for p in $@; do
		export PATH=$p/bin${PATH:+:}$PATH
	done
}

unset PATH

exportPath $buildInputs
exportPath $baseInputs

wget $url/$src
tar -xzf $src

for d in *; do
	if [ -d $d ]; then
		cd $d
	fi
done

./configure --prefix=$out
make
make install

echo "--- FIXUP PHASE ---"
find $out -type f -exec patchelf --shrink-rpath '{}' \; -exec strip '{}' \; 2>/dev/null
