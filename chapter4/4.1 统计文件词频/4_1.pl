#实现思想：读取文件每一行，然后建立一个关键字是词，词出现次数是值
#的哈希变量。同时记录总的词数，最后遍历输出关键字和值，得到
#每个词的出现频率和频次。
	
#打开进行词频统计的文件
open(In,"ci_biao.txt");    
#统计词表中总的词数,以便计算词的出现频率和频次
$i=0;  
while($line=<In>){ 
	#去掉$line中的回车符   
	chomp($line);    

	#查找当前词是否在%hash中，如果在，原来频次加1，否则频次设为1	
	if( defined $Hash{$line} ) {                               
		$Hash{$line}++;    
	}else{
		$Hash{$line}=1;
	}
	$i++;
}
#关闭打开的文件。
close(In);            

#上面的while循环建立了包含词和词频的哈希变量，现在通过遍历有序地输出
foreach $element(sort keys %Hash){    
	#每个词的出现频次除以总行数就是使用频率  
	$tf=$Hash{$element}/$i;             
	#把以上信息输出
	print "$element	$tf	$Hash{$element}\n";    
}