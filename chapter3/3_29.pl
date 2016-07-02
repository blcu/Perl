open(In,"read_file.txt") || die("error in open!");
@lines=<In>;
chomp(@lines);
close(In);

foreach $Line (@lines){
	print "$Line\n";
}