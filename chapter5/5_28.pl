#�����ܣ������¸�ʽ�������
open(In,"dict.txt");       
while(<In>){               
	chomp;                   
	#ģʽ/(.+)=>(.+)/����ƥ�京�����á�=>�����ӵķǿ��Ӵ����ַ���
	if(/(.+)=>(.+)/){        
		$word=$1;              
		$trans=$2;             
		print "#$word\nTrans:$trans\n";
	}                        
}                          
close(In);                 
