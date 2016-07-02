$num = int(rand(100));
print "随机数：$num\n";
print "奇偶判定结果：";
Func($num);

sub Func {
	my ($aNum)=@_;
	if ($aNum%2==0) {
		print "$aNum是偶数";
	}
	else {
		print "$aNum是奇数";
	}
}