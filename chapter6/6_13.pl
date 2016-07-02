
#创建my类型的子哈希
my %hash1=("1","Aurora","2","Evelyn");
my %hash2=("1","Lingkar","2","Cathy");
my %hash3=("1","Klara");
#通过引用构建一个值为哈希的哈希（%hash）
%hash=("24",\%hash1,"26",\%hash2);
$hash{"27"}=\%hash3;

#对%hash进行成员访问
print "通过引用对%hash进行成员访问：\n";
print ${$hash{"24"}}{"1"}."\t";
#获得对%hash1的引用
$refHash=$hash{"24"};  
print ${$refHash}{"2"}."\t";

#对%hash进行遍历
print "通过引用对%hash进行成员遍历：\n";
foreach(sort keys %hash){
	#获得值引用，通过引用进行成员遍历
	$refHash=$hash{$_};
	print "$_=>\n";
	foreach(sort keys %{$refHash}) {
		print "$_=>${$refHash}{$_}, ";
	}
	print "\n";
}

