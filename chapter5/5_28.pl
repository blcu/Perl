#程序功能：按照新格式输出词条
open(In,"dict.txt");       
while(<In>){               
	chomp;                   
	#模式/(.+)=>(.+)/用以匹配含两个用“=>”连接的非空子串的字符串
	if(/(.+)=>(.+)/){        
		$word=$1;              
		$trans=$2;             
		print "#$word\nTrans:$trans\n";
	}                        
}                          
close(In);                 

