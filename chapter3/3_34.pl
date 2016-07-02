open (Out,">c.txt");

open(In,"a.txt");
while( $Line=<In>) {
	chomp($Line);
	print Out "$Line\n";
}
close(In);

open (In,"b.txt");
while ( $Line=<In>) {
	chomp($Line);
	print Out "$Line\n";
}
close(In);

close(Out);

