@array=(1,2,3,4,5);

($first,$second)= @array;
print "数组的第1个成员: $first\n";
print "数组的第2个成员: $second\n";

($first,$second,@subArray)= @array;
print "$first $second ";

foreach $ele (@subArray){
	print "$ele ";
}

