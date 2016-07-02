#程序功能：在$line中找出含有连续任意个“a”并以“b”结束的子串
#并依次输出
$line="aaababaaaaaaab";
@array=$line=~/a*b/g;  
foreach (@array){      
	print $_."\t";       
}        
              