open(In,"pos.txt");
while(<In>){
	chomp;
	#删除文本中每行前面的出处信息
	if (/^\S+\s+(.*)/){
		$Sent=$1;
		#得到词语
		@Words=$Sent=~/(\S+)\/\S+/g;
		#得到词性
		@POSs=$Sent=~/\S+\/(\S+)/g;
		#遍历词语和词性，构造值为哈希的哈希	
		for($i=0; $i<@Words; $i++){
				${$hash{$Words[$i]}}{$POSs[$i]}++;
		}
	}
}
close(In);

#遍历主哈希变量，关键字为词语
foreach $word(sort keys %hash){
	print "$word=>";
	#得到引用，该引用指向内层封装词语词性信息的哈希
	$refPos=$hash{$word};	
	foreach $pos(sort keys %{$refPos}){
		print "$pos, ${$refPos}{$pos}; ";
	}
	print "\n";
}

