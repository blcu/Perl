print hello("world");
sub hello(){
	my ($str)=@_;
	$str="hello $str!\n";
	return $str;
}