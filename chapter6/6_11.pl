
#建立两个临时数组（@array1、@array2）
my @array1=("a","b","c");
my @array2=("d","e","f");

#获取@array1及@array2的引用，并将这两个引用作为
#目标数组（@array）的成员，从而完成二维数组（@array）的构造
@array=(\@array1,\@array2);

my @array2=("i","j","k");

#对@array插入子数组
push(@array,\@array2);

#对二维数组的成员进行访问
$refArray=$array[0];
${$refArray}[3]="d"; #对$refArray所指向的数组添加一个成员“d”
print "${$refArray}[0]\n";
print "${$array[1]}[1]\n";

#对二维数组进行成员遍历
foreach (@array){
	$refArray=$_;
	foreach (sort @{$refArray}){
		print "$_\t";
	}
	print "\n";
}

