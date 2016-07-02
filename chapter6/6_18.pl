#程序功能：查词典
#实现思路：用值为数组的哈希封装词典

#读词典
sub ReadDict{
	my($file)=@_;
	open(In,$file);
	while(<In>){
		chomp;
		#获得单词和译文
		if(/(.*)=>(.*)/){
			my $word=$1;
			#用@作为隔离，取得多个译文项，放到数组中
			#注意这里的数组一定是my类型变量
			my @trans=$2=~/[^@]+/g;
			#构造值为数组的哈希
			$hash{$word}=\@trans;
		}
	}
	close(In);
}

#查找函数
sub Search{
	my($word)=@_;
	#在哈希表中找单词
	if(defined $hash{$word}){
		#如果找到，取得指向译文数组的引用
		$pointer=$hash{$word};
		#通过引用，访问数组成员
		foreach(@$pointer){
			print "$_\n";
		}
	}else{
		print "no found!\n";
	}
}

#初始化词表
ReadDict("dict.txt");	
while(1){
	#提示信息
	print "Please input a word:('q' for exit)\n";
	#从标准输入设备中得到输入
	$input=<stdin>;
	chomp($input);
	if( $input eq "q"){
		last;
	}
	#调用查找函数
	Search($input);	
}
