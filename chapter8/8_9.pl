use Encode;
use utf8;
open(In,"input.txt");
while(<In>){
	chomp;
	Encode::_utf8_on($_);
	if (/^[你,我,他,她,它]/){
		print encode("gb2312",$_)."\n";
	}	
}
close(In);

