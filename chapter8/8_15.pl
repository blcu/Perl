#�����ܣ���utf8������ļ�ת��Ϊgb2312�����ļ�,
#					 �����������gb2312��ʽ���
use Encode;
#�����ַ�ʽ�򿪵��ļ������������ַ�����utf8���͵��ַ���
open(In,"<:encoding(UTF-8)","$ARGV[0]");
#�����ַ�ʽ�򿪵��ļ���д�������ַ������ֽ����ַ���
open(Out,">$ARGV[1]");
while(<In>){
 	chomp; 
 	#��utf8��תΪgb2312�ֽ�����
 	$Str=encode("gb2312",$_);
 	print Out "$Str";
} 
close(In);
close(Out);
 
 
 