$num = int(rand(100));
print "�������$num\n";
print "��ż�ж������";
Func($num);

sub Func {
	my ($aNum)=@_;
	if ($aNum%2==0) {
		print "$aNum��ż��";
	}
	else {
		print "$aNum������";
	}
}