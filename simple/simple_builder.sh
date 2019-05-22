export PATH="$coreutils/bin:$gcc/bin:$binutils/bin"
echo $binutils
mkdir $out
gcc -o $out/simple $src
