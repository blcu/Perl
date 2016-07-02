
@array=(1,0,4,2,5,3);

#获得数组（@array）的一个引用（$refArray）
$refArray=\@array;

#利用$refArray对数组成员进行排序及遍历
foreach(sort @{$refArray}){
		print "$_\t";
}

