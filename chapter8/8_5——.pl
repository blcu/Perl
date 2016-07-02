#程序功能：通过文件列表构造批处理perl程序

open(In,"list.txt");
open(Out,">batch.pl");
while(<In>){
	chomp;
	#因为是perl程序，路径符号"\"需要转义
	s/\\/\\\\/g;
	$Inp=$_;
	$Out=$_;	
	$Out=~s/rst$/out/;
	#在批处理脚本中，打印处理进度信息
	print Out "print \"processing $Inp\\n\";\n";
	print Out "system(\"mycode.pl -d $Inp $Out\");\n"
}
close(In);
close(Out);



