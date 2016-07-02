%Ages = ("Maris", 61, "Aaron", 75, "Young", 51);
foreach $aName (sort{$Ages{$a}<=>$Ages{$b}} keys %Ages){
	print "$aName	$Ages{$aName}\n";
}
