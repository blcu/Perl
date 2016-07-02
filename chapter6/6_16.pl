#读入词表
sub ReadDict{
	my ($file)=@_;
	open(In,$file);
	while(<In>){
		chomp;
		#利用模式匹配提取词条中的单词和译文数组。由于采用了相同的
		#数组名称，因此需要使用“my”开辟新的地址空间
		if(/(.*)=>(.*)/){
			my $word=$1;
			#用“@”作为隔离符，取得多个译文项，放到数组中
			#注意这里的数组一定是my类型变量
			my @trans=$2=~/[^@]+/g;
			#构造值为数组的哈希变量
			$hash{$word}=\@trans;
			}
		}
	close(In);
	}
	
	