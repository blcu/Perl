open(In,"pinyin.txt");
while(<In>){
	chomp;
	#提取词语和拼音信息
	@Words=$_=~/(\S+)\[[^\]]*\]/g;
	@PY=$_=~/\S+\[([^\]]*)\]/g;
	#构建数据结构
	for( $i=0; $i<@Words; $i++ ){
			${$hash{$Words[$i]}}{$PY[$i]}++;
	}
}
close(In);

#遍历输出结果
foreach (sort keys %hash){
	$refPY=$hash{$_}; 
	my @arr= keys %{$refPY};
	if(@arr > 1){
		$str="$_=>";
		foreach (sort @arr){
			$str.="[$_],${$refPY}{$_};";
		}
		print "$str\n";
	}
}
