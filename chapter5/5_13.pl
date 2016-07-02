#程序功能：在数组（@array）中找出以“good bye”结尾的成员
@array=("hello","Hi,good bye","good bye!","good bye bye");
foreach(@array){
	if(/good bye$/){
		print "T\t"; 
	}
	else{
		print "F\t";
	}
}

