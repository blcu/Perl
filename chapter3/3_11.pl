@array=(1,2,3,4,5);

($first,$second)= @array;
print "����ĵ�1����Ա: $first\n";
print "����ĵ�2����Ա: $second\n";

($first,$second,@subArray)= @array;
print "$first $second ";

foreach $ele (@subArray){
	print "$ele ";
}

