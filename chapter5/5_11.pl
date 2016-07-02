#程序功能：在数组（@array）中找出“a”最少出现2次，最多出现4次，且其后
#紧跟1个“b”的成员
@array=("aab","bab","baaab","baaaaaaaab");
foreach $value(@array){
	if($value=~/a{2,4}b/){
		print "T:$value\t"; 
	}
	else{
		print "F\t";
	}
}

