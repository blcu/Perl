open(In,"page.html");
$MeetBody=0;
while(<In>){
	chomp;	
	if(/<title>(.+)<\/title>/i){
		print "Title:$1\n";
	}
	#遇到<boby>，状态标识变量（$MeetBody）为1
	if(/<body>/i){
		print "body:\n";
		$MeetBody=1;
		next;
	}
	#遇到</boby>，状态标识变量（$MeetBody）为0
	if(/<\/body>/i){
		$MeetBody=0;
		last;
	}
	
	#状态标识变量打开时，也就是进入正文中
	if ( $MeetBody == 1 ){	
			s/\<[^>]+\>//g;
			print "$_\n";
	}

}
close(In);

