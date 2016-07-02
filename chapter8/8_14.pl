#程序功能：把gb2312编码的文件转换为utf8编码文件,
#					 本程序代码以gb2312格式存放
use Encode;
#打开的文件，读进来的字符串是字节流字符串
open(In,"$ARGV[0]");
#用这种方式打开文件，保证写文件带有utf8文件头标记
open(Out,">:encoding(UTF-8)","$ARGV[1]");
while(<In>){
 	chomp; 	
 	#gb2312字节流串转化为utf8字符串
 	$Str=decode("gb2312",$_);
 	print Out "$Str\n";
} 
close(In);
close(Out);


