
my @age;
my @name;

#打开文件
open (In,"age.txt");	
while (<In>) {
	chomp;
	#用正则表达式分隔人名和年龄
	($n,$a)=/[^,]+/g;
	#构造人名数组
	push (@name,$n);
	#构造年龄数组	
	push (@age,$a);	
}
#关闭文件
close (In); 

#获取@age、@name的引用
#将这些数组引用作为@array的成员，使得@array成为一个二维数组
@array=(\@age,\@name);

#获得对@age的引用
$refArray1=$array[0];
#获得对@name的引用	
$refArray2=$array[1];
for ($num=0;$num<@age;$num++)	{
	print ${$refArray1}[$num]."\t".${$refArray2}[$num]."\n";
}

