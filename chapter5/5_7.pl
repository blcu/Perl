#程序功能：找出数组（@array）中以“ab”开头，以“c”结尾的长度为4的成员
@array=("abac","abbc","ab1c","ab\nc");
foreach $value (@array){

	if($value=~/ab.c/){
		print "T\t"; 
	}
	else{
		print "F\t";
	}
}
