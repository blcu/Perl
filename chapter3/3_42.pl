open(Out,">c.txt");
MergeFile("a.txt",Out);
MergeFile("b.txt",Out);
close(Out);

sub MergeFile(){
	my ($filename, $fp)=@_;
	open(In,$filename);
	while(<In>){
		chomp;
		print $fp "$_\n";
	}
	close(In);
}
