#�����ܣ������飨@array�����ҳ��ԡ�hello����ͷ�ĳ�Ա
@array=("hello","Hi,hello"," hello","ab\nc");
foreach(@array){
	if(/^hello/){
		print "T\t"; 
	}
	else{
		print "F\t";
	}
}