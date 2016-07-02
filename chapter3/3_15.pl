@array=("a","bc","abc","bcd","c");
$lastEle=pop(@array);
$firstEle=shift(@array);
unshift(@array,$lastEle);
push(@array,$firstEle);
print "$firstEle $lastEle\n";
foreach $ele(@array){
	print $ele." ";
}
