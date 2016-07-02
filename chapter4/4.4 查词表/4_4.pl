#程序功能：查词表
#实现思想：把词表文件的单词和译文放到一个哈希变量中。哈希成员的关键字是单词，值是译文。
#查词典就是判定给定单词是否为一个哈希成员的关键字，如果是就把对应的值输出。

#读入词表文件
open(In,"dict.txt");
while($line=<In>){
	chomp($line);
	#词典的结构，“单词=>译文”，以“=>”为标记，用函数split()来分割每一行的词条
	@array=split("=>",$line);	
	#数组的第一个成员是单词，第二个元素是译文，把它们分别赋值给哈希变量
	$word{$array[0]}=$array[1];	
}                               
close(In);

#while循环用来接收多次用户输入，直到用户输入'q'退出程序
while(1)	{           
	print "Please input a word:('q' for exit)\n";	
	$input=<stdin>;	
	#千万记得使用函数chomp()，输入内容的尾部都是自动带一个回车的
	chomp($input);	
	
	if( $input eq "q" )	{
		print "exit!\n";
		exit;	
	}
	
	#查找哈希变量中是否有哈希成员的关键字为输入的单词，有则输出对应的值
	if( defined $word{$input} )	{                           
		print "translation:\n$word{$input}\n";
	}else{
		print "not found!\n"
	}
}




