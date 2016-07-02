@array1=(1,2);
@array2=("a","b");
push(@array1, @array2);

foreach (@array1) {
	print $_."\t";
}