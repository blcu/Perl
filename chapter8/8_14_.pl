#�����ܣ�����gb2312��������ϣ�ͳ�Ƴ��ֵ���Ƶ
use Encode;
open(In,"$ARGV[0]");
open(Out,">$ARGV[1]");
while(<In>){
 	chomp; 	
 	#gb2312��$_תΪutf8�ַ���$Str
 	$Str=decode("gb2312",$_);
 	#�����ֲ��
 	@AllC=$Str=~/./g;
 	#���������飬�ù�ϣͳ�ƴ�Ƶ
 	foreach (@AllC){
 		$HashFreq{$_}++;
 	}
} 
close(In);

#���չ�ϣ��value��ֵ�Ӵ�С�����������
foreach (sort{$HashFreq{$b}<=>$HashFreq{$a}} keys %HashFreq){
 	print Out encode("gb2312",$_)."\t".$HashFreq{$_}."\n";
}
close(Out);

