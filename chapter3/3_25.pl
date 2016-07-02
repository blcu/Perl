%Ages = ("Maris", 61, "Aaron", 75, "Young", 51);
if(defined $Ages{"Mark"}){
	$Ages{"Mark"}++;
}
else{
	$Ages{"Mark"}=20;
}
foreach $aName (sort {$Ages{$a} <=> $Ages{$b} } keys %Ages){
	print "$aName\t$Ages{$aName}\n";
}
