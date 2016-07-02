#程序功能：把utf8编码的文件转换为gb2312编码文件,
#					 本程序代码以gb2312格式存放
use Encode;
#以这种方式打开的文件，读出来的字符串是utf8类型的字符串
open(In,"<:encoding(UTF-8)","$ARGV[0]");
#以这种方式打开的文件，写进来的字符串是字节流字符串
open(Out,">$ARGV[1]");
while(<In>){
 	chomp; 
 	#把utf8串转为gb2312字节流串
 	$Str=encode("gb2312",$_);
 	print Out "$Str";
} 
close(In);
close(Out);
 
 
 