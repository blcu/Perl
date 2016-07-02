#程序功能：perl的utf8字符串用法示例，本程序代码以utf8格式存放
use Encode;
use utf8;
#因为有”use utf8“，同时代码文件为utf8编码，$Str现为utf8字符串，
$Str="我们正在上课";

#标准读入的字符串是gb2312,字节流字符串
$myStr=<stdin>;
chomp($myStr);
#转换为utf8字符串
$myStr=decode("gb2312",$myStr);
#utf8编码形式的字符串模式匹配
print $Str =~/$myStr/ ? "found!\n":"not found!\n";
print length($Str)."\t".length($myStr)."\n";



