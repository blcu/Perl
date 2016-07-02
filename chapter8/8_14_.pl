#程序功能：给定gb2312编码的语料，统计出现的字频
use Encode;
open(In,"$ARGV[0]");
open(Out,">$ARGV[1]");
while(<In>){
 	chomp; 	
 	#gb2312串$_转为utf8字符串$Str
 	$Str=decode("gb2312",$_);
 	#进行字拆分
 	@AllC=$Str=~/./g;
 	#遍历字数组，用哈希统计词频
 	foreach (@AllC){
 		$HashFreq{$_}++;
 	}
} 
close(In);

#按照哈希的value数值从大到小进行排序输出
foreach (sort{$HashFreq{$b}<=>$HashFreq{$a}} keys %HashFreq){
 	print Out encode("gb2312",$_)."\t".$HashFreq{$_}."\n";
}
close(Out);


