#程序功能：空格为分隔标记，把句子中的单词一次性存为数组成员，并输出
$line="hello world , what a day .";
#模式/\S+/g具有与“split('\s')”等同的切分效果
@array=$line=~/\S+/g;
foreach ( sort @array ){
	print "$_\t";
}

