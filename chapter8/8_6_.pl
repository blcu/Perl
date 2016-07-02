open(In,"list.txt");
while(<In>){
	chomp;
	Process($_);
}
close(In);

sub Process
{
	my($file)=@_;
	print "process file $file here\n";
} 

