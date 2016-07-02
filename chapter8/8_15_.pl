#程序功能：给定gb2312编码的语料，按照标点符号进行断句，
#					 本代码文件为utf8编码
use Encode;
#在代码中出现的字符串常量等都是utf8编码的，并认为是utf8字符串
use utf8;
open(In,"$ARGV[0]");
open(Out,">$ARGV[1]");
while(<In>){
 	chomp; 	
 	#gb2312串$_转为utf8字符串$Str
 	$Str=decode("gb2312",$_);
 	#在标点后面加回车符号
	$Str=~s/([。！？；])/$1\n/g;
	#输出gb2312类型的字节流字符串
 	print Out encode("gb2312",$Str);

} 
close(In);
close(Out);


