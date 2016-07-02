$a=1;	#具有全局作用域的全局变量（$a）
func();
print $a." ";

sub func(){
	my $a=2;	#具有函数作用域的局部变量（$a）
	{
		my $a=3;	#具有代码块作用域的局部变量（$a）
		print $a." ";
	}
	print $a." ";
}



