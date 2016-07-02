for ($i=1; $i<=3;$i++) {
	print "第$i次调用HelloOrBye:";
	HelloOrBye();
}

sub HelloOrBye(){
	my $str1="hello,world!\n";
	my $str2="good bye!\n";

	my $n=int(rand(2));
	if($n) {
	  print $str1;
	}
	else{
	  print $str2;
	}
}