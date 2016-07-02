%Ages = ("Maris", 61, "Aaron", 75, "Young", 51);
foreach $Name (sort keys %Ages){
	print "$Name	$Ages{$Name}\n";
}
