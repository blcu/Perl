
#����������ʱ���飨@array1��@array2��
my @array1=("a","b","c");
my @array2=("d","e","f");

#��ȡ@array1��@array2�����ã�����������������Ϊ
#Ŀ�����飨@array���ĳ�Ա���Ӷ���ɶ�ά���飨@array���Ĺ���
@array=(\@array1,\@array2);

my @array2=("i","j","k");

#��@array����������
push(@array,\@array2);

#�Զ�ά����ĳ�Ա���з���
$refArray=$array[0];
${$refArray}[3]="d"; #��$refArray��ָ�����������һ����Ա��d��
print "${$refArray}[0]\n";
print "${$array[1]}[1]\n";

#�Զ�ά������г�Ա����
foreach (@array){
	$refArray=$_;
	foreach (sort @{$refArray}){
		print "$_\t";
	}
	print "\n";
}
