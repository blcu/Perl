$a=1;	#����ȫ���������ȫ�ֱ�����$a��
func();
print $a." ";

sub func(){
	my $a=2;	#���к���������ľֲ�������$a��
	{
		my $a=3;	#���д����������ľֲ�������$a��
		print $a." ";
	}
	print $a." ";
}


