@array=("a","bc","abc","bcd","c");
@newArray=sort @array;
foreach $ele(@newArray){
	print $ele." ";
}
