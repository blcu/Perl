#程序功能：perl的utf8字符串用法示例，本程序代码以utf8格式存放
use Encode;
#$Str是字节流字符串
$Str="我们正在上课";

#打开utf8标记，$Str现在为utf8字符串
Encode::_utf8_on($Str);
#读入的变量为gb2312编码
$myStr=<stdin>;
chomp($myStr);
#转化为utf8字符串
$myStr=decode("gb2312",$myStr);
#模式匹配，这里在perl内部每个汉字都认为是一个字符
print $Str =~/$myStr/ ? "found!\n":"not found!\n";
print length($Str)."\t".length($myStr)."\n";



