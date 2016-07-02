#程序功能：用utf8字符串实现汉语最大长度匹配分词

use Encode;

#装载汉语分词词表到哈希表%HashDict，并记录词表中词的最大长度$MaxLexLen
sub LoadDic
{
	my($Dict)=@_;	
	open(In,"$Dict");
	while(<In>){
	 	chomp;
	 	#字节流字符串$_转成utf8字符串
		$Str=decode("gb2312",$_);
		#记录最大长度
		if ( $MaxLexLen < length($Str) ){
			$MaxLexLen = length($Str);
		}
		#用哈希表存放汉语词，哈希value没有简单置1
		$HashDict{$Str}=1;
	} 
	close(In);
}

#最大长度分词函数
sub Segment
{
	my($Sent)=@_;
	#输入的是gb2312字节流字符串，转为utf8字符串
	$Sent=decode("gb2312",$Sent);
	
	#存放分词结果
	my $Segmented="";
	
	#从左到右切分$Sent，知道切完为止
	while( length($Sent) > 0 ){
		#比较当前$Sent长度和$MaxLexLen，取得最大切分长度
		$TryLen=$MaxLexLen;
		if ( $TryLen > length($Sent) ){
			$TryLen=length($Sent);
		}
		
		#从最大长度开始，不断提取子串，进行查词典，如果在成功切出一个词，这是$i > 0
		for($i=$TryLen;$i>0;$i--){
			my $Tmp=substr($Sent,0,$i);
			if ( defined $HashDict{$Tmp} ){
				last;			
			}
		}
		
		#没有成功切出词，默认切分一个汉字
		if($i == 0 ){
			$i=1;
		}
		
		#取得切分出的词
		$Segmented.=substr($Sent,0,$i)." ";
		#从$sent左边去掉切出的词
		$Sent=substr($Sent,$i,length($Sent)-$i);
	}
	
	#包括$Segmented，以上都是utf8字符串操作，现转为gb2312字节流字符串
	$Segmented=encode("gb2312",$Segmented);
	return $Segmented;
}

#分词主流程
LoadDic("word.txt");
open(In,"$ARGV[0]");
open(Out,">$ARGV[1]");
while(<In>){
 	chomp; 	
 	$Segmented=Segment($_);
	print Out "$Segmented\n"; 	
} 
close(In);
close(Out);
