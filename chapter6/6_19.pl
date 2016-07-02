#程序功能：统计pos.txt中出现的词和词性
#实现思想：用值为哈希的哈希封装词和对应词性
open(In,"pos.txt");
while($Sent=<In>){
	chomp $Sent;
	@Words=$Sent=~/(\S+)\/\S+/g;
	#得到每个词的词性
	@POSs=$Sent=~/\S+\/(\S+)/g;
	#遍历词和词性，构造值为哈希的哈希（%hash）
	for($i=0; $i<@Words; $i++) {
		#查找当前词是否已经在%hash中
		if(defined $hash{$Words[$i]}) {
			#取得%hash的值，即指向子哈希的引用
			$refPOS=$hash{$Words[$i]};
			#给子哈希加入一个词性
			${$refPOS}{$POSs[$i]}=1;
		}else{
			#构造一个my类型的子哈希，指向这个哈希的引用作为%hash的值
			my %posHash=($POSs[$i],1);
			$hash{$Words[$i]}=\%posHash;
		}
  }
}
close(In);

#遍历%hash
foreach $word(sort keys %hash) {
	print "$word\t";
	$pPOS=$hash{$word};
	foreach $pos(sort keys %{$pPOS}) {
		print "$pos;";
	}
	print "\n";
}

