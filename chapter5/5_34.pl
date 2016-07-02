#程序功能：在词性标注语料库（pos.txt）中，提取词性为v、v的
#2个连续词语词性对
#实现思想：采用正则表达式提取

open(In,"pos.txt");
while(<In>){
	chomp;
	#删除文本中每行前面的出处信息
	if (/^\S+\s+(.*)/){
		$Sent=$1;
		#整理语料库，消除多空格情况
		$Sent=~s/  / /g;
		#模式匹配
		@phrase=$Sent=~/\S+\/v \S+\/v/g;
		#遍历
		foreach (@phrase){
			  print "$_\n";
		}
	}
}
close(In);

