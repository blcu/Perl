%Ages = ("Maris", 61, "Aaron", 75, "Young", 51);
@names=keys %Ages;
foreach $Name (@names){
	print "$Name:$Ages{$Name}\n";
}