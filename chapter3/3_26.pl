%Ages = ("Maris", 61, "Aaron", 75, "Young", 51);
delete $Ages{"Aaron"};
foreach $Name (sort keys %Ages){
	print "$Name	$Ages{$Name}\n";
}
