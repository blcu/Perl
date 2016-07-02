open(In, "dict.txt");
while(<In>){
	chomp;
	#提取词条中的单词和译文
	if(/(.*)=>(.*)/){
		#将单词另存到变量（$enWord）
		$enWord=$1;
		#获得译文数组（@trans）
		@trans=$2=~/[^@]+/g;
		#从每个译项中提取汉语释义
		foreach (@trans){
			$oneTrans=$_;
			#获取同词性下的子译文（$oneTrans）
			$oneTrans=~s/^[a-z]{1,4}\. //;
			#获得子译文数组（@Words）
			@Words=$oneTrans=~/[^;]+/g;
			#构造值为数组的哈希
			foreach $cnWord(@Words){
				push(@{$hash{$cnWord}},$enWord);
			}
		}
	}
}
close(In);


#遍历输出值为数组的哈希
foreach(sort keys %hash){
	$str="$_=>";
	$refTrans=$hash{$_};
	foreach(sort @{$refTrans}){
		$str.="$_;";
	}
	chop($str);	
	print "$str\n";
}
