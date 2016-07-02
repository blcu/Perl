while(<>){
	if(/href=\"([^\"]+)\"/){
		print "$1\n";
	}
}