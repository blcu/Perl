
@array1=("a","b","c");
@array2=("d","e","f");
@array3=("s","t","z");

#��ȡ@array1��@array2��@array3�����ã�������Щ���������
#��ΪĿ�����飨@array���ĳ�Ա��ʹ��@array��Ϊһ����ά����
@array=(\@array1,\@array2,\@array3);

#��ȡ@array�ĵ�1����Ա�������@array1�����ã�$refArray��
$refArray=$array[0];

#ͨ��$refArray����@array�ĵ�1����Ա��@array1�����г�Ա
print "@$refArray\n";

#ͨ��$refArray����@array�ĵ�1����Ա��@array1�ĵ�3����Ա
print "${$refArray}[2]\n";
