#程序功能：找出数组（@array）中以“b”开头，以“a”结尾的长度为2或3的成员
@array=("aab","bab","baaaba","baaaaaaaab");
foreach $value(@array){
	if( $value=~/b.?a/){
		print "T:$value\t";
	}else{
		print "F\t";
	}
}

