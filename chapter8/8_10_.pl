#程序功能：在UTF8编码的文件中输出含有“你我他”的句子，输出格式为GB2312
#          本程序代码格式为utf8

use Encode;
#用这种方式，表示在代码中出现的字符串常量等都是utf8编码的，
#并认为是utf8字符串
use utf8;
open(In,"<:encoding(UTF-8)","$ARGV[0]");
while(<In>){
 	chomp; 	
 	if ( /[我你他]/ ){
 		#将识别出来的字符编为gb2312
		print encode("gb2312",$_)."\n";	
 	}	
} 
close(In);


