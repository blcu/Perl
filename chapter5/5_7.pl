#�����ܣ��ҳ����飨@array�����ԡ�ab����ͷ���ԡ�c����β�ĳ���Ϊ4�ĳ�Ա
@array=("abac","abbc","ab1c","ab\nc");
foreach $value (@array){

	if($value=~/ab.c/){
		print "T\t"; 
	}
	else{
		print "F\t";
	}
}