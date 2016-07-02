while(1) {
	print "pls input a string:\"q\" for exit\n";
	$str=<stdin>;
	chomp($str);
	if($str eq "q") {
		print "THE END!\n";
		last;
	}
	print ">>$str\n";
}