#�����ܣ������飨@array�����ҳ��ԡ�ab����ͷ�ԡ�c����β�ĳ���Ϊ4�ĳ�Ա
#�����ԡ�a����ͷ�ԡ�d����β�ĳ���Ϊ3�ĳ�Ա
@array=("abac","abbc","ab1c","abd","abcd");
foreach $value (@array){
	if($value=~/ab.c|a.d/){
		print "T\t"; 
	}
	else{
		print "F\t";
	}
}