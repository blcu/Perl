open (Out,">c.txt");
@File=("a.txt","b.txt");
foreach $file(@Files){
  Process($file,Out);
}
close(Out);

sub Process
{
	my($file,$Handle)=@_;
	open(In,"$file");
	while ($Line=<In>) {
			chomp($Line);
			print $Handle "$Line\n";
		}
		close(In);
}