
@array1=("a","b","c");

#������飨@array����һ�����ã�$refArray��
$refArray=\@array1;

#����$refArray��������ĸ�ֵ
@array2=@{$refArray};

#����$refArray����@array1�еĳ�Ա
print ${$refArray}[0]."\t".$array2[0]."\n";
print ${$refArray}[1]."\n";
