#程序功能：求两个词表的交集。
#实现思想：先对一个词表文件建立哈希变量，哈希成员的关键字为该词表中的词，
#值都简单设1。读入另一个词表文件的词，在建立好的哈希变量
#中查找。如果找到，就是交集中的一个词

#打开一个词表文件
open(In,"ci_biao1.txt");	
while($Word=<In>){
	chomp($Word);
	#把"ci_biao1.txt"中的词记录在一个哈希变量中
	$Hash{$Word}=1;
}

close(In);

#打开另一个词表文件
open(In2,"ci_biao2.txt");	
while($Word=<In2>){
	chomp($Word);
	#判断读入的当前词，是否在"ci_biao1.txt"的哈希变量中，
	#如果在就说明它是重复的词，输出即可。
	if( defined $Hash{$Word} ){                           
		print "$Word\n";
	}
}

close(In2);


