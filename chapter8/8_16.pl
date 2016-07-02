#程序功能：给定gb2312编码的语料, 每个汉字后面加空格，实现断字输出
use Encode;
open(In,"$ARGV[0]");
open(Out,">$ARGV[1]");
while(<In>){
 	chomp; 	
 	#把gb2312字节流字符串转为utf8字符串 	
 	$Str=decode("gb2312",$_);
 	#用正则表达式实现断字
 	$Str=~s/./$& /g;
 	#utf8字符串转为gb2312字节流字符串
	print Out encode("gb2312",$Str)."\n"; 	
} 
close(In);
close(Out);




