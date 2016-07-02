
@array1=("a","b","c");
@array2=("d","e","f");
@array3=("s","t","z");

#获取@array1、@array2、@array3的引用，并将这些数组的引用
#作为目标数组（@array）的成员，使得@array成为一个二维数组
@array=(\@array1,\@array2,\@array3);

#获取@array的第1个成员，即获得@array1的引用（$refArray）
$refArray=$array[0];

#通过$refArray访问@array的第1个成员：@array1的所有成员
print "@$refArray\n";

#通过$refArray访问@array的第1个成员：@array1的第3个成员
print "${$refArray}[2]\n";

