
@array1=("a","b","c");

#获得数组（@array）的一个引用（$refArray）
$refArray=\@array1;

#利用$refArray进行数组的赋值
@array2=@{$refArray};

#利用$refArray访问@array1中的成员
print ${$refArray}[0]."\t".$array2[0]."\n";
print ${$refArray}[1]."\n";

