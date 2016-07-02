
open(In,"age.txt");
while($line=<In>){
	chomp($line);
	#分离出人名和年龄
	if ($line=~/([^,]+),([^,]+)/){
		push(@{$hash{$2}},$1);
	}
}
close(In);


#对值为数组的哈希（%hash）进行遍历
foreach (sort keys %hash){
	#获取%hash的关键字，即年龄
	$age=$_;       
	print "$age\n";
	#获取%hash的值，是一个数组的引用
	$refName=$hash{$_};   
	#对数组进行遍历
	foreach( @{$refName} ){
		print "$_\t";
	}
	print "\n";
}

