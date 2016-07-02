$str="abbcd";
if($str=~/abc|bcd/){
	print $&;
}
