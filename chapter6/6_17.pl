sub Search{
	my($word)=@_;
	#在哈希变量（%hash）中找单词
	if(defined $hash{$word}){
		#如果找到，取得指向译文数组的引用
		$pointer=$hash{$word};
		#通过引用，访问数组成员
		foreach(@$pointer){
				print "$_\n";
			}
		}else{
			print "not found!\n";	
		}
}
	
	