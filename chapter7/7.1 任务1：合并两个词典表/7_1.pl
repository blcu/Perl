ReadDict("dict1.txt");
ReadDict("dict2.txt");
Output();

#读取词表信息
sub ReadDict{
	my ($file)=@_;
	open(In,$file);
	while(<In>){
		chomp;
		#提取有效数据
		if(/(.*)=>(.*)/){
			$word=$1;			
			@trans=$2=~/[^@]+/g;
			#构造合适的数据结构，进行数据合并和存储
			foreach(@trans){
				${$hash{$word}}{$_}=1;
			}
		}
	}
	close(In);	
}

#输出合并后的词表
sub Output{
	foreach(sort keys %hash){
		print "$_=>";	
		$trans="";
		$pTrans=$hash{$_};
		foreach(sort keys %{$pTrans}){
			$trans.="$_@";
		}
		#去掉结尾的“@”符号
		chop($trans);
		print "$trans\n";
	}
}
