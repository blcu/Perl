#程序功能：合并两个词表，并保证合并后词表没有重复词。
#实现思想：合并两个词表利用的是哈希变量的一个性质：当一个新添加的
#哈希成员的关键字和已有的哈希成员重复的话，那么新成员就会覆
#盖掉旧成员。这样可以先给一个词表文件建立一个哈希变量。
#然后把另一个词表文件的词依次再放进刚才建好的哈希变
#量中。重复的会自动覆盖，而不需要担心有重复成员出现。

#打开一个词表文件
open(In,"ci_biao1.txt");
while($line=<In>){
	chomp($line);
	#哈希变量中关键字相同的成员会自动覆盖，值是什么就不重要了，都赋值为为1
	$Hash{$line}=1;			
}                           
close(In);

#打开另一个词表文件
open(In2,"ci_biao2.txt");	
while($line=<In2>){
	chomp($line);
	$Hash{$line}=1;
}
close(In2);

#将合并后的词表文件有序地输出
foreach $element(sort keys %Hash){	
	
	print "$element\n";
}


