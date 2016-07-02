#程序功能：找出数组（@array）中找出含有“b”之后又有“a”的成员
@array=("aab","bab","baaaba","baaaaaaaab");
foreach $value(@array){
	if( $value=~/b.*a/){
		print "T:$value\t";
	}else{
		print "F\t";
	}
}
