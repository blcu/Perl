#程序功能：在数组（@array）中找出以“ab”开头以“c”结尾的长度为4的成员
#或者以“a”开头以“d”结尾的长度为3的成员
@array=("abac","abbc","ab1c","abd","abcd");
foreach $value (@array){
	if($value=~/ab.c|a.d/){
		print "T\t"; 
	}
	else{
		print "F\t";
	}
}
