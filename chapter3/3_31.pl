open(In,"read_file.txt");
open(Out,">out.txt");
while($lines=<In>){
	chomp($lines);
	print Out "$lines\n";
}
close(In);
close(Out);



