#程序功能：依照给定词表，对输入句子进行最大长度匹配的汉语分词
#实现思想：把词表放入哈希变量中，并记录词表词语的最大长度，
#对输入句子从左到右进行最大长度匹配的分词

#读入词表文件，并记录词表中词的最大长度
ReadDict("word.txt");
#通过循环用户不断输入句子，进行分词处理，直到输入'q'或'exit'退出程序
print "Please input a sentence:(press \"exit\" or \"q\" to quit!)\n=>";
while (1){
	$Sent=<STDIN>;
	chomp($Sent);
	#“||”表示“或”，也就是说，用户输入'q'或'exit'，程序都可以退出。
	if ( $Sent eq 'exit' || $Sent eq 'q' ){	
		exit;
	}	
	
	#调用分词函数Segment()。
	$Result=Segment($Sent);	
	print "$Result\n=>";	
}
sub ReadDict
{
	#得到函数参数，即词表文件名
	my ($Dict)=@_;	
	
	open(In,"$Dict");
	#变量$MaxLen用来存储词表中最大词长度
	$MaxLen=0;	
	while($Line=<In>){
		chomp($Line);
		
		#哈希变量的值存储了词的长度
		$MapDict{$Line}=length($Line);	
		
		#如果发现有比现有长度还大的词长度，就将这个值赋予$MaxLen，
		#因此当while循环结束的时候，$MaxLen等于最大词长度
		if ( length($Line) > $MaxLen  ){
			$MaxLen=length($Line);
		}
	}
	close(In);

}
sub Segment
{
	my ($aSentence)=@_;	
	#$Segmented:存储切分结果；$Remained：存储尚未分词的字串
	my $Segemted="";	
	my $Remained=$aSentence; 
	
	#$Remained长度大于0，说明字串尚未分词完毕
	while ( length($Remained) > 0 ){	
		#$Match起一个标签的作用，值为1表示能在词典中查到该词，值为0表示没有找到
		$Match=0;	
		
		#从$MaxLen开始获取一个字串作为候选词,与词表中的词进行匹配
		for( $i=$MaxLen;$i>1;$i-- ){	
			$MatchString=substr($Remained,0,$i);	
			#在词表中有完全匹配词语，就停止词匹配
			if ( defined $MapDict{$MatchString} ){	
				$Match=1;
				last;	
			}
		}
	  
	  #若没有在词表中找到可匹配的词语，强行将一个字符（需判定半角或全角）判定为词语
		if ( $Match == 0 ){	
			#对当前字符进行全角或半角判定：全角2个字节，半角1个字节
			if ( ord($Remained) &0x80 ){	
				$i=2;	
			}else{
				$i=1;	
			}
		}
		
		$MatchString=substr($Remained,0,$i);	
		$Segemted.=$MatchString."\/";	
		$Remained=substr($Remained,$i,length($Remained)-$i);
	}
	return $Segemted;	
}

