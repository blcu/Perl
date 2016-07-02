if (@ARGV != 3){
	print "usage:\n mycode.pl ¨Cd|-e input1 input2\n"; 
	exit;
}
open(In,"$ARGV[1]");
open(Out,">$ARGV[2]");
	
while(<In>){
	chomp;
	if ($ARGV[0] eq "-d" ){
	  print Out "here is ¨Cd processing\n";
	} 
	
	if ($ARGV[0] eq "-e" ){
	  print Out "here is ¨Ce processing\n";
	} 
}
close(In);
close(Out);



