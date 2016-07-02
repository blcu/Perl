#程序功能：在数组（@array）中找出以“hello”开头的成员
@array=("hello","Hi,hello"," hello","ab\nc");
foreach(@array){
	if(/^hello/){
		print "T\t"; 
	}
	else{
		print "F\t";
	}
}
