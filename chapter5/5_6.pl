#程序功能：在数组（@array）中找出不含数字的成员
@array=("abc","abbc","1bcd","dbc");
foreach $value(@array){
#以数组@array的成员（$value）为操作对象，只要$value中
#不含数字字符，就算匹配成功，输出“T”；否则输出“F”
	if($value=~/[^0-9]/){
		print "T\t"; 
	}
	else{
		print "F\t";
	}
}

