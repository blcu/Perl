#程序功能：给定gb2312编码的语料，格式为一句一行，抽取符合模式的句子，
#					 本代码文件为utf8编码
use Encode;
#在代码中出现的字符串常量等都是utf8编码的，并认为是utf8字符串
use utf8;

open(In,"$ARGV[0]");
open(Out,">$ARGV[1]");
while(<In>){
 	chomp; 	
 	$Str=decode("gb2312",$_);
	#输出含有“因为，所以”的句子
	if ( $Str=~/因为.*所以/ ){
	 	print Out encode("gb2312",$Str);
	}
	
	#输出包含“你们”或者“我们”或者”他们“所有句子
	if ( $Str=~/[我你他]们/ ){
	 	print Out encode("gb2312",$Str);
	}

	#输出包含“地震”或者“灾害“所有句子
	if ( $Str=~/地震|灾害/ ){
	 	print Out encode("gb2312",$Str);
	}

} 
close(In);
close(Out);



