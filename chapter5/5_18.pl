#程序功能：找出$line中忽略大小写的含有连续任意个“a”
#并以“b”结束的子串
$line="aaabAbaAAaaaab";
@array=$line=~/a*b/gi;
#遍历数组（@array）
foreach(@array){
	print $_."\t";
}
