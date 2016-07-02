open (Out,">c.txt");
@File=("a.txt","b.txt");
foreach $file(@Files){

	open(In,"$file");
	while ($Line=<In>) {
		chomp($Line);
		print Out "$Line\n";
	}
	close(In);
}
close(Out);

