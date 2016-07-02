@array=(1,3,10,2,21);
@newArray1=sort {$a <=> $b} @array;
foreach $ele(@newArray1){
	print $ele." ";
}
print "\n";
foreach $ele(sort {$b <=> $a} @array){
	print $ele." ";
}