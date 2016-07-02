print "\nPls input a num for printing:(1-10) \n";
$num = <stdin>;
chomp ( $num );
for ($i=0;$i<$num;$i++) {
	for ($j=0;$j<$num-$i;$j++) {
		print " ";
	}
	for ($j=0;$j<$i*2+1;$j++) {
		print "*";
	}
	print "\n";
}
print "\n";